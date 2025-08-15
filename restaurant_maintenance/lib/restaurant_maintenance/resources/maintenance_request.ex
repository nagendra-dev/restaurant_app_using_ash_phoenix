defmodule RestaurantMaintenance.Resources.MaintenanceRequest do
  use Ash.Resource,
    domain: RestaurantMaintenance,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "maintenance_requests"
    repo RestaurantMaintenance.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :description, :string, allow_nil?: false
    attribute :status, :string do
      default "pending"
    end
    attribute :equipment_id, :uuid
  end

  relationships do
    belongs_to :equipment, RestaurantMaintenance.Resources.Equipment
  end

  actions do
    create :create do
      accept [:description, :status, :equipment_id]
    end
    defaults [:read, :update, :destroy]
  end

  validations do
    validate one_of(:status, ["pending", "in_progress", "completed"])
  end
end
