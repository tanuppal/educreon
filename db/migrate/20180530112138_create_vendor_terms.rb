class CreateVendorTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_terms do |t|
      t.text :term

      t.timestamps
    end
  end
end
