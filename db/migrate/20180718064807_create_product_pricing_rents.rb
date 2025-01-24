class CreateProductPricingRents < ActiveRecord::Migration[5.1]
  def change
    create_table :product_pricing_rents do |t|
      t.string :name
      t.float :price
      t.references :product_rental, foreign_key: true

      t.timestamps
    end
  end
end
