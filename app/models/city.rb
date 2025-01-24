class City < ApplicationRecord
  belongs_to :state, required: false
  has_many :customer_locations
  has_many :vendor_locations
  has_many :customer_insurances
  has_one :company

end
