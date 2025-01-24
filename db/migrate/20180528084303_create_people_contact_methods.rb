class CreatePeopleContactMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :people_contact_methods do |t|
      t.references :contact_method_type, foreign_key: true
      t.string :phone
      t.string :email
      t.boolean :is_primary
      t.references :people_contact, foreign_key: true

      t.timestamps
    end
  end
end
