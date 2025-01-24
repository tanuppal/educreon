class CreateOrderShipTos < ActiveRecord::Migration[5.1]
  def change
    create_table :order_ship_tos do |t|
      t.references :customer_location, foreign_key: true
      t.references :country, foreign_key: true
      t.references :state, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
