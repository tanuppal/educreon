class CreateReceivingProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :receiving_products do |t|
      t.references :product, foreign_key: true
      t.references :receiving, foreign_key: true
      t.float :fine, :default => 0.0

      t.timestamps
    end
  end
end
