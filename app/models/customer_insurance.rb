class CustomerInsurance < ApplicationRecord
	belongs_to :customer, required: false
	belongs_to :country, required: false
	belongs_to :state, required: false
	belongs_to :city, required: false
	before_save :check_is_true
	def check_is_true
		if self.insured == true
			all_customer_insurance = CustomerInsurance.where("customer_id = ?",self.customer_id)
			all_customer_insurance.update_all(:insured => false)
		end
	end
end
