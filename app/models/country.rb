class Country < ApplicationRecord
	has_many :states
	has_many :customer_locations
	has_many :vendor_locations
	has_many :customer_insurances
	has_one :company
end
