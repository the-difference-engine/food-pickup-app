class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :city
      t.string :state, limit: 2
      t.string :street
      t.integer :zipcode, limit: 5
      t.string :phone_number
      t.string :email

      t.timestamps
    end

    create_table :volunteer_food_pickups do |t|
      t.integer :volunteer_id
      t.integer :food_pickup_id
    end
  end
end
