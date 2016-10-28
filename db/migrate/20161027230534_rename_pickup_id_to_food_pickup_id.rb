class RenamePickupIdToFoodPickupId < ActiveRecord::Migration[5.0]
  def change
    rename_column :donor_pickups, :pickup_id, :food_pickup_id
  end
end
