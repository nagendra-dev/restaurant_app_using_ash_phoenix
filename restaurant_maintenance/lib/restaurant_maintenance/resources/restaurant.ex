defmodule RestaurantMaintenance.Resources.Restaurant do
  use Ash.Resource,
    domain: RestaurantMaintenance,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "restaurants"
    repo RestaurantMaintenance.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :name, :string, allow_nil?: false
    attribute :location, :string
  end

  actions do
    create :create do
      accept [:name, :location]
    end

    update :update do
      accept [:name, :location]
    end

    defaults [:read, :destroy]
  end
end
