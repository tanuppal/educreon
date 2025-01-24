class AddCustomerToCustomerDocument < ActiveRecord::Migration[5.1]
  def change
    add_reference :customer_documents, :customer, foreign_key: true
  end
end
