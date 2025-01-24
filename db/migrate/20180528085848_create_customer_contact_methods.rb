class CreateCustomerContactMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_contact_methods do |t|
      t.references :contact_method_type, foreign_key: true
      t.string :phone
      t.string :email
      t.boolean :is_primary
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
