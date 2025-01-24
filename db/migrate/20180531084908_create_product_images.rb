class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
      t.attachment :image
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
