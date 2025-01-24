class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :url
      t.references :vendor_type, foreign_key: true
      t.references :vendor_term, foreign_key: true
      t.references :vendor_status, foreign_key: true

      t.timestamps
    end
  end
end
