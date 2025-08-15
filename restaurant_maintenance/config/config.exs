# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :restaurant_maintenance,
  ash_domains: [RestaurantMaintenance],
  database: System.get_env("DATABASE") || "restaurant_maintenance_dev",
  username: System.get_env("DATABASE_USERNAME") || "postgres",
  password: System.get_env("DATABASE_PASSWORD") || "postgres",
  hostname: System.get_env("DATABASE_HOSTNAME") || "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  ecto_repos: [RestaurantMaintenance.Repo]

# Configures the endpoint
config :restaurant_maintenance, RestaurantMaintenanceWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: RestaurantMaintenanceWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: RestaurantMaintenance.PubSub,
  live_view: [signing_salt: "XiXuHmCt"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :restaurant_maintenance, RestaurantMaintenance.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
