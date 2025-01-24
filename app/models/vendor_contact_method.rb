class VendorContactMethod < ApplicationRecord
  belongs_to :vendor, required: false
  validates :contact_method_type, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  before_save :check_self_true
  def check_self_true
  	if self.is_primary == true
  		all_vendor_customer_contact_methods = VendorContactMethod.where("vendor_id = ?",vendor_id)
   		all_vendor_customer_contact_methods.update_all(:is_primary=>false)
   	end	
   end 
end