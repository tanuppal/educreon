class AddColumnToKitItem < ActiveRecord::Migration[5.1]
  def change
    add_column :kit_items, :available_quantity, :float
  end
end
