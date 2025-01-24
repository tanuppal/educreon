class AddKitItemToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :kit_item, foreign_key: true
  end
end
