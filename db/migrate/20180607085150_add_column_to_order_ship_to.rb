class AddColumnToOrderShipTo < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_ship_tos, :order, foreign_key: true
  end
end
