class CreateCustomerRelatedNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_related_notes do |t|
      t.text :note
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
