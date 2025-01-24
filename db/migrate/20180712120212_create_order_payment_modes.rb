class CreateOrderPaymentModes < ActiveRecord::Migration[5.1]
  def change
    create_table :order_payment_modes do |t|
      t.string :name

      t.timestamps
    end
  end
end
