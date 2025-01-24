class AddColumnFromOrderPayment < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_payments, :order_payment_mode, foreign_key: true
  end
end
