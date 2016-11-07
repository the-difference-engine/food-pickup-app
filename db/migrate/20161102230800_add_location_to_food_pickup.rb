class AddLocationToFoodPickup < ActiveRecord::Migration[5.0]
  def change
    add_column :food_pickups, :location, :string
  end
end
