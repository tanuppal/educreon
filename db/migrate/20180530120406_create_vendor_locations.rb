class CreateVendorLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_locations do |t|
      t.string :name
      t.references :vendor_person, foreign_key: true
      t.text :address_1
      t.text :address_2
      t.references :country, foreign_key: true
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.string :phone
      t.boolean :is_primary
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
