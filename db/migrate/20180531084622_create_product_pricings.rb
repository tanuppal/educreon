class CreateProductPricings < ActiveRecord::Migration[5.1]
  def change
    create_table :product_pricings do |t|
      t.string :cost
      t.string :price
      t.boolean :taxable
      t.references :vendor, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
