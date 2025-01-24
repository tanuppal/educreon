class AddColumnInsuranceToCustomerInsurance < ActiveRecord::Migration[5.1]
  def change
    add_reference :customer_insurances, :country, foreign_key: true
    add_reference :customer_insurances, :state, foreign_key: true
    add_reference :customer_insurances, :city, foreign_key: true
    add_column :customer_insurances, :zipcode, :string
    add_column :customer_insurances, :telephone, :string
    add_column :customer_insurances, :fax, :string
    add_column :customer_insurances, :email, :string
    add_column :customer_insurances, :insured, :boolean
  end
end
