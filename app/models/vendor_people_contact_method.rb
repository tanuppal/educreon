class VendorPeopleContactMethod < ApplicationRecord
  belongs_to :vendor_person, required: false 
  # validates :contact_method_type, presence: true
  # validates :phone, presence: true
  # validates :email, presence: true 
  before_save :check_is_true
  def check_is_true
  	if self.is_primary == true
  		all_vendor_people_contact_methods = VendorPeopleContactMethod.where("vendor_person_id = ?",self.vendor_person_id)
  		all_vendor_people_contact_methods.update_all(is_primary: false)
  	end	
  end
end
