class ChangeColumnInsuredToCustomerInsurance < ActiveRecord::Migration[5.1]
  def change
  	change_column :customer_insurances, :insured, :boolean, :default => true
  end
end
