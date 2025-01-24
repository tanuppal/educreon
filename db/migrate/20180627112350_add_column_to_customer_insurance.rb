class AddColumnToCustomerInsurance < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_insurances, :address, :text
  end
end
