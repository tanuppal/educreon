class ChangeBooleanColumnToAllVendor < ActiveRecord::Migration[5.1]
  def change
  	change_column :vendor_contact_methods, :is_primary, :boolean, :default=>false
  	change_column :vendor_people_contact_methods, :is_primary, :boolean, :default=>false
  end
end
