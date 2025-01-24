class CreateTrackBarcodes < ActiveRecord::Migration[5.1]
  def change
    create_table :track_barcodes do |t|
      t.string :barcode
      t.integer :serial_no, limit: 8
      t.date :date
      t.float :purchase_cost
      t.integer :depreciation_year
      t.float :approx_value
      t.integer :year_placed_in_svc

      t.timestamps
    end
  end
end
