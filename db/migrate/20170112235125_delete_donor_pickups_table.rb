class DeleteDonorPickupsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :donor_pickups
    add_column :food_pickups, :donor_id, :integer
  end
end
