class ChangeBooleanAllColumnFromCustomer < ActiveRecord::Migration[5.1]
  def change
  	change_column :customer_locations, :is_primary, :boolean 
  	change_column :people_contact_methods, :is_primary, :boolean
  	change_column :customer_contact_methods, :is_primary, :boolean 
  end
end
