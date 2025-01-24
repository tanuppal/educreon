class RemoveVendorColumnFromVendorPeopleContactMethod < ActiveRecord::Migration[5.1]
  def change
    remove_reference :vendor_people_contact_methods, :vendor, foreign_key: true
  end
end
