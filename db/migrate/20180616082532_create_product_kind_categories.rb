class CreateProductKindCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_kind_categories do |t|
      t.string :name
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
