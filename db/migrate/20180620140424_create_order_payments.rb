class CreateOrderPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :order_payments do |t|
      t.string :payment_mode
      t.float :amount
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
