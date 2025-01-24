class CreateVendorDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_documents do |t|
      t.string :title
      t.references :document_type, foreign_key: true
      t.attachment :document_file
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
