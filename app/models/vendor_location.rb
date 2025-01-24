class VendorLocation < ApplicationRecord
  belongs_to :vendor_people, required: false
  belongs_to :country, required: false
  belongs_to :city, required: false
  belongs_to :state, required: false
  belongs_to :vendor, required: false
  validates :name, presence: true
  # validates :vendor_person_id, presence: true
  validates :address_1, presence: true
  validates :country_id, presence: true
  validates :state_id, presence: true
  validates :city_id, presence: true
  validates :phone, presence: true
  validates :zipcode, presence: true
 
end
