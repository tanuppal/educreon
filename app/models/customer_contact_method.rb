class CustomerContactMethod < ApplicationRecord
	belongs_to :contact_method_type, required: false
	belongs_to :customer, required: false

	validates :contact_method_type_id, presence: true
	validates :phone, presence: true
	validates :email, presence: true
	before_save :check_is_true

	def check_is_true
		if self.is_primary == true
			all_customer_contact_methods = CustomerContactMethod.where("customer_id = ?",self.customer_id)
			all_customer_contact_methods.update_all(:is_primary => false)
		end
	end
end
