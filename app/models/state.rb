class State < ApplicationRecord
  belongs_to :country, required: false
  has_many :cities
  has_many :customer_locations
  has_many :vendor_locations
  has_many :customer_insurances
  has_one :company
end
