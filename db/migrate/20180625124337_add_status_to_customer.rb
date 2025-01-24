class AddStatusToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :status, :string
  end
end
