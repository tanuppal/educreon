class VendorPerson < ApplicationRecord
  belongs_to :vendor, required: false
  has_many :vendor_people_contact_methods, :dependent => :destroy 
  # validates :first_name, presence: true
  # validates :status, presence: true
  # validates :department, presence: true
  accepts_nested_attributes_for :vendor_people_contact_methods, :allow_destroy => true
end
