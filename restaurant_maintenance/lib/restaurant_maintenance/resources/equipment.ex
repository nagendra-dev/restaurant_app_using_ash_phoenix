defmodule RestaurantMaintenance.Resources.Equipment do
  use Ash.Resource,
    domain: RestaurantMaintenance,
    data_layer: AshPostgres.DataLayer

    postgres do
      table "equipment"
      repo RestaurantMaintenance.Repo
    end

    attributes do
      uuid_primary_key :id
      attribute :name, :string, allow_nil?: false
      attribute :equipment_type, :string
      attribute :restaurant_id, :uuid
    end

    actions do
      create :create do
        accept [:name, :equipment_type, :restaurant_id]
      end

      defaults [:read, :destroy, :update]
    end

    relationships do # bt default primary_key value it takes.
      belongs_to :restaurant, RestaurantMaintenance.Resources.Restaurant,
        attribute_writable?: false,
        allow_nil?: false
    end

  #relationships do
  #  belongs_to :user, MyApp.User do
  #    source_attribute :user_email    # from Order
  #    destination_attribute :email    # to User
  #    define_attribute? false         # we already defined `user_email` above
  #  end
  #end
end
