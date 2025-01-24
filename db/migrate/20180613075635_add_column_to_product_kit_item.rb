class AddColumnToProductKitItem < ActiveRecord::Migration[5.1]
  def change
    add_column :product_kit_items, :quantity, :float
  end
end
