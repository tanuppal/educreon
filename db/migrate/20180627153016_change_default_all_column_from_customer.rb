class ChangeDefaultAllColumnFromCustomer < ActiveRecord::Migration[5.1]
  def change
  	change_column :customer_locations, :is_primary, :boolean, :default=>nil 
  	change_column :people_contact_methods, :is_primary, :boolean, :default=>nil
  	change_column :customer_contact_methods, :is_primary, :boolean, :default=>nil
  	change_column :customer_insurances, :insured, :boolean, :default=>nil
  end
end
