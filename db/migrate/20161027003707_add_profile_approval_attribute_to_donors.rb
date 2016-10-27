class AddProfileApprovalAttributeToDonors < ActiveRecord::Migration[5.0]
  def change
    add_column :donors, :approved, :boolean, default: false
  end
end
