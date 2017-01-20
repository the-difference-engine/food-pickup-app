class UpdateFoodPickupChargeAttr < ActiveRecord::Migration[5.0]
  def change
    change_column :food_pickups, :charge, :decimal, precision: 5, scale: 2
  end
end
