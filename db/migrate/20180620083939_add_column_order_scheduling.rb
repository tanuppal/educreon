class AddColumnOrderScheduling < ActiveRecord::Migration[5.1]
  def change
  	add_column :order_schedulings, :barcode, :string
  end
end
