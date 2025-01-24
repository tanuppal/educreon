class AddVendorPersonColumnToVendorPeopleContactMethod < ActiveRecord::Migration[5.1]
  def change
    add_reference :vendor_people_contact_methods, :vendor_person, foreign_key: true
  end
end
