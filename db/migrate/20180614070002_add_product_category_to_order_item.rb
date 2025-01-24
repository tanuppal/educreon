class AddProductCategoryToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :product_category, foreign_key: true
  end
end
