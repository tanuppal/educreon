class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :manufacturer
      t.string :name
      t.string :barcode
      t.references :product_type, foreign_key: true
      t.references :product_category, foreign_key: true
      t.references :product_status, foreign_key: true
      t.boolean :is_kit
      t.boolean :track_barcode

      t.timestamps
    end
  end
end
