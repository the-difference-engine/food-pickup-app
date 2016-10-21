class UpdateAdminToFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :donors, :admin, :boolean, default: false
  end
end
