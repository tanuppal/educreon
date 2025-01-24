class CreateBillNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_notes do |t|
      t.text :note
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
