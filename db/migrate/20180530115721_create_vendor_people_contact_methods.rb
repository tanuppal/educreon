class CreateVendorPeopleContactMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_people_contact_methods do |t|
      t.string :contact_method_type
      t.string :phone
      t.string :email
      t.boolean :is_primary
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
