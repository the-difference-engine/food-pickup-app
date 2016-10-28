class CreateFoodPickups < ActiveRecord::Migration[5.0]
  def change
    create_table :food_pickups do |t|
      t.string :picture
      t.text :description
      t.integer :quantity
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
