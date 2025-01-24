class ChangeColumnBooleanInsuredToCustomerInsurance < ActiveRecord::Migration[5.1]
  def change
  	  	change_column :customer_insurances, :insured, :boolean
  end
end
