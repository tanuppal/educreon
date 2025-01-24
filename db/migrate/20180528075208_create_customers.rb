class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :url
      t.references :customer_type, foreign_key: true
      t.references :customer_term, foreign_key: true
      t.references :customer_source, foreign_key: true
      t.references :customer_shipping, foreign_key: true
      t.references :customer_status, foreign_key: true

      t.timestamps
    end
  end
end
