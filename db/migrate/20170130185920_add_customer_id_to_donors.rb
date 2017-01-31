class AddCustomerIdToDonors < ActiveRecord::Migration[5.0]
  def change
    add_column :donors, :customer_id, :string
  end
end
