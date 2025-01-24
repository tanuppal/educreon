class CreateProductKitItems < ActiveRecord::Migration[5.1]
  def change
    create_table :product_kit_items do |t|
      t.references :product, foreign_key: true
      t.references :kit_item, foreign_key: true

      t.timestamps
    end
  end
end
