defmodule RestaurantMaintenance do
  @moduledoc """
  RestaurantMaintenance keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  use Ash.Domain

  resources do
    resource RestaurantMaintenance.Resources.Restaurant
    resource RestaurantMaintenance.Resources.Equipment
    resource RestaurantMaintenance.Resources.MaintenanceRequest
  end
end
