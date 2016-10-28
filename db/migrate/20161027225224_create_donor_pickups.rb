class CreateDonorPickups < ActiveRecord::Migration[5.0]
  def change
    create_table :donor_pickups do |t|
      t.integer :donor_id
      t.integer :pickup_id

      t.timestamps
    end
  end
end
