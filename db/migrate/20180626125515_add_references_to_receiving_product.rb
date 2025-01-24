class AddReferencesToReceivingProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :receiving_products, :order, foreign_key: true
  end
end
