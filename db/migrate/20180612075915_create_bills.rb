class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.integer :number
      t.date :date
      t.date :eta
      t.references :vendor, foreign_key: true
      t.references :bill_status, foreign_key: true

      t.timestamps
    end
  end
end
