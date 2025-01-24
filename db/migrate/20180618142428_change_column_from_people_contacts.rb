class ChangeColumnFromPeopleContacts < ActiveRecord::Migration[5.1]
  def change
  	change_column :people_contacts, :status, :string
  end
end
