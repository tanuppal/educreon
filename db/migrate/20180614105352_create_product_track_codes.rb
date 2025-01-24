class CreateProductTrackCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_track_codes do |t|
      t.references :track_barcode, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
