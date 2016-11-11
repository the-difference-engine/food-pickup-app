class AddApprovedToFoodPickup < ActiveRecord::Migration[5.0]
  def change
    add_column :food_pickups, :approved, :boolean, default: false
  end
end
