class CreateReceivings < ActiveRecord::Migration[5.1]
  def change
    create_table :receivings do |t|
      t.string :barcode
      t.boolean :status
      t.date :received_date
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
