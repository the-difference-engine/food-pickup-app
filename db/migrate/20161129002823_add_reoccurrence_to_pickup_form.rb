class AddReoccurrenceToPickupForm < ActiveRecord::Migration[5.0]
  def change
    add_column :food_pickups, :reoccurrence, :string
  end
end
