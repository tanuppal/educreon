class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :order_type, foreign_key: true
      t.references :sales_person, foreign_key: true
      t.date :date
      t.string :cust_po
      t.references :payment_term, foreign_key: true
      t.references :order_status, foreign_key: true
      t.integer :number, limit: 8
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
