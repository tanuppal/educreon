class CreateCustomerDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_documents do |t|
      t.string :title
      t.references :document_type, foreign_key: true
      t.attachment :document

      t.timestamps
    end
  end
end
