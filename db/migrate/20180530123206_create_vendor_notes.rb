class CreateVendorNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_notes do |t|
      t.text :note
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
