class CreateCustomerLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_locations do |t|
      t.string :name
      t.string :attn
      t.text :address_line_1
      t.text :address_line_2
      t.references :country, foreign_key: true
      t.references :state, foreign_key: true
      t.references :city, foreign_key: true
      t.string :phone
      t.string :landmark
      t.boolean :is_primary
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
