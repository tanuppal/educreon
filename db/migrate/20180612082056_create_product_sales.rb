class CreateProductSales < ActiveRecord::Migration[5.1]
  def change
    create_table :product_sales do |t|
      t.references :product, foreign_key: true
      t.float :quantity_in_stock
      t.date :reorder_when_at_or_below
      t.float :reorder_qty

      t.timestamps
    end
  end
end
