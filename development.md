# Steps to create application

1. Install phoenix

    mix archive.install hex phx.new


2. create new Ash-poneix project

   mix phx.new restaurant_app --no-html --no-assets

   cd restaurant_app

3. Add Ash dependencies in mix.exe

4. Configure DB

# Once configuration is done run the following command.

5. mix ash.setup # from your root directory to setup Ash framework and create database if it does not exists
 

6. mix ash_postgres.generate_migrations --name add_resturant_maintenance_tables


The above 2 commands will do 2 things:

1. Set up the data layer for ash.
2. Generate migrations for the database

7. mix ash_postgres.migrate # run your migration to create actual tables in the database by running the


# Sample commands to inert entry to database table using elixir shell.

# create restuarant
 {:ok, restaurant} = RestaurantMaintenance.Resources.Restaurant |> Ash.Changeset.for_create(:create, %{name: "Rameshwaram cafe", location: "Bengaluru"}) |> RestaurantMaintenance.create()

# create eqiupment
 {:ok, equipment} = RestaurantMaintenance.Resources.Equipment |> Ash.Changeset.for_create(:create, %{name: "Oven", equipment_type: "Kitchen", restaurant_id: restaurant.id}) |> RestaurantMaintenance.create()

 # Create maintenance request
{:ok, maintenance_req} = RestaurantMaintenance.Resources.MaintenanceRequest |> Ash.Changeset.for_create(:create, %{description: "Oven not heating", equipment_id: equipment.id}) |> RestaurantMaintenance.create()


# Read from table

Ash.get(RestaurantMaintenance.Resources.MaintenanceRequest, maintenance_req.id)

{:ok,
 %RestaurantMaintenance.Resources.MaintenanceRequest{
   id: "0457e95c-ae9d-4e20-8e7e-7edfb3fca717",
   description: "Oven not heating",
   status: "pending",
   equipment_id: "2490791f-1ccb-4c74-8b8b-9424f643f7bf",
   equipment: #Ash.NotLoaded<:relationship, field: :equipment>,
   __meta__: #Ecto.Schema.Metadata<:loaded, "maintenance_requests">
 }}


# read

require Ash.Query

restaurant =
  RestaurantMaintenance.Resources.Restaurant
  |> Ash.Query.filter(name == "Caffae")
  |> Ash.read(domain: RestaurantMaintenance)


# Seed data into database

attrs = [
    %{
        name: "Chai point",
        location: "Bengaluru"
    },
    %{
        name: "Caffae",
        location: Mysore
    }
]

Ash.Seed.seed!(RestaurantMaintenance.Resources.Restaurant, attrs)

# update
 import Ash.Query

 {:ok, restaurant} = RestaurantMaintenance.Resources.Restaurant |> Ash.Query.filter(name == "Caffae") |> Ash.read(domain: RestaurantMaintenance)

[ restaurant | _ ] = restaurant
restaurant |> Ash.Changeset.for_update(:update, %{name: "Caffae Coffe"}) |> Ash.update


# Delete

RestaurantMaintenance.Resources.Restaurant |> Ash.Query.filter(name: "Rameshwaram cafe") |> Ash.read_first!() |> Ash.destroy

# Extra
# DB is running in below postgres

docker run --name postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=restaurant_maintenance_dev \
  -p 5432:5432 \
  -d postgres:15