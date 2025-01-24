class AddColumnsOrderScheduling < ActiveRecord::Migration[5.1]
  def change
  	add_reference :order_schedulings, :product, foreign_key: true
  	add_column :order_schedulings, :status, :boolean, :default => true
  end
end
