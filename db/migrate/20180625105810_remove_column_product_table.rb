class RemoveColumnProductTable < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :products, :vendor, index: true, foreign_key: true
  end
end
