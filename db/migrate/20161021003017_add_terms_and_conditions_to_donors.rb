class AddTermsAndConditionsToDonors < ActiveRecord::Migration[5.0]
  def change
    add_column :donors, :terms, :boolean, default: false
  end
end
