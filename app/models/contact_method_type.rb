class ContactMethodType < ApplicationRecord
	has_many :people_contact_methods
	has_many :customer_contact_methods
end
