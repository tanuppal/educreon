class CreatePeopleContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :people_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :salutation
      t.string :title
      t.boolean :status
      t.string :department
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
