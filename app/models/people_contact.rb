class PeopleContact < ApplicationRecord
  belongs_to :customer, required: false
  has_many :people_contact_methods, :dependent => :destroy
  # validates :first_name, presence: true
  # validates :status, presence: true
  # validates :salutation, presence: true

  accepts_nested_attributes_for :people_contact_methods, :allow_destroy => true
end
