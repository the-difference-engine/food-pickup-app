class AddChargeToDonor < ActiveRecord::Migration[5.0]
  def change
    add_column :donors, :charge, :decimal, precision: 6, scale: 2
    add_column :donors, :negotiable, :boolean, default: false
  end
end
