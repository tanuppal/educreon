class Vendor < ApplicationRecord
  belongs_to :vendor_type, required: false
  belongs_to :vendor_term, required: false
  belongs_to :vendor_status, required: false

  has_many :vendor_contact_methods, :dependent => :destroy
  has_many :vendor_documents, :dependent => :destroy
  has_many :vendor_locations, :dependent => :destroy
  has_many :vendor_persons, :dependent => :destroy
  has_many :vendor_notes, :dependent => :destroy
  has_one :product_pricing , :dependent => :destroy
  has_many :bills, :dependent => :destroy

   validates :name, presence: true
   validates :vendor_type_id, presence: true
   validates :vendor_term_id, presence: true
   
   validates :vendor_status_id, presence: true

  accepts_nested_attributes_for :vendor_contact_methods, :allow_destroy => true
  accepts_nested_attributes_for :vendor_notes, :allow_destroy => true
  accepts_nested_attributes_for :vendor_documents, :allow_destroy => true
  accepts_nested_attributes_for :vendor_persons, :allow_destroy => true
  accepts_nested_attributes_for :vendor_locations, :allow_destroy => true
  scope :all_vendor_count, -> {where( "id is NOT NULL")}
end
