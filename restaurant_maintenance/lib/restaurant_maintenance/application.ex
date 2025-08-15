defmodule RestaurantMaintenance.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RestaurantMaintenanceWeb.Telemetry,
      RestaurantMaintenance.Repo,
      {DNSCluster, query: Application.get_env(:restaurant_maintenance, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RestaurantMaintenance.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RestaurantMaintenance.Finch},
      # Start a worker by calling: RestaurantMaintenance.Worker.start_link(arg)
      # {RestaurantMaintenance.Worker, arg},
      # Start to serve requests, typically the last entry
      RestaurantMaintenanceWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RestaurantMaintenance.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RestaurantMaintenanceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
