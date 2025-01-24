class RemoveColumnsReceiving < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :receivings, :order, index: true, foreign_key: true
  	remove_reference :receivings, :product, index: true, foreign_key: true
  	remove_column :receivings, :barcode
  	remove_column :receivings, :status
  end
end
