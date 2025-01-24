class AddColumnsToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :product_kind_category, foreign_key: true
  end
end
