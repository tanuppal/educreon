class CreateOrderNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :order_notes do |t|
      t.text :note
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
