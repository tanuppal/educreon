class CreateProductDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_descriptions do |t|
      t.text :description
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
