class AddcolumsProductTable < ActiveRecord::Migration[5.1]
  def change
  	add_reference :products, :vendor, foreign_key: true
  end
end
