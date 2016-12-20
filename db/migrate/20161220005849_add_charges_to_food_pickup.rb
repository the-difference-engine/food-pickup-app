class AddChargesToFoodPickup < ActiveRecord::Migration[5.0]
  def change
    add_column :food_pickups, :charge, :decimal
  end
end
