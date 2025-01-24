class AddColumnToCustomerLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_locations, :zipcode, :integer
  end
end
