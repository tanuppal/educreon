class ChangeBooleanColumnFromCustomerContactMethods < ActiveRecord::Migration[5.1]
  def change
  	change_column :customer_contact_methods, :is_primary, :boolean, :default => true 
  end
end
