class AddAttributeToDonor < ActiveRecord::Migration[5.0]
  def change
    add_column :donors, :business_name, :string
    add_column :donors, :address, :string
    add_column :donors, :phone_number, :string
    add_column :donors, :contact_name, :string
    add_column :donors, :type_of_donor, :string
  end
end
