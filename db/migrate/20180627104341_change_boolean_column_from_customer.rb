class ChangeBooleanColumnFromCustomer < ActiveRecord::Migration[5.1]
  def change
  	change_column :customer_locations, :is_primary, :boolean, :default => true 
  	change_column :people_contact_methods, :is_primary, :boolean, :default => true 
  end
end
