class AddPaidToFoodPickups < ActiveRecord::Migration[5.0]
  def change
    add_column :food_pickups, :paid, :boolean, default: false
  end
end
