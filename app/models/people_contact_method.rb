class PeopleContactMethod < ApplicationRecord
  belongs_to :contact_method_type, required: false
  belongs_to :people_contact, required: false
  # validates :phone, presence: true
  # validates :contact_method_type_id, presence: true
  # validates :email, presence: true

  before_save :check_is_true
  def check_is_true
  	if self.is_primary == true
  		all_customer_people_contact_method = PeopleContactMethod.where("people_contact_id = ?",self.people_contact_id)
  		all_customer_people_contact_method.update_all(:is_primary=>false)
  	end
  end
end
