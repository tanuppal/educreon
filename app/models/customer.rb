class Customer < ApplicationRecord
  belongs_to :customer_type, required: false
  belongs_to :customer_term, required: false
  belongs_to :customer_source, required: false
  belongs_to :customer_shipping, required: false
  belongs_to :customer_status, required: false

  has_many :people_contacts, :dependent => :destroy
  has_many :customer_contact_methods, :dependent => :destroy
  has_many :customer_locations, :dependent => :destroy
  has_many :customer_insurances, :dependent => :destroy
  has_many :customer_related_notes, :dependent => :destroy
  has_many :customer_documents, :dependent => :destroy
  has_many :orders, :dependent => :destroy


  validates :name, presence: true
  validates :customer_type_id, presence: true
  validates :customer_term_id, presence: true
  
  validates :customer_source_id, presence: true
  validates :customer_shipping_id, presence: true

  accepts_nested_attributes_for :customer_contact_methods, :allow_destroy => true
  accepts_nested_attributes_for :customer_locations, :allow_destroy => true
  accepts_nested_attributes_for :customer_insurances, :allow_destroy => true
  accepts_nested_attributes_for :customer_related_notes, :allow_destroy => true
  accepts_nested_attributes_for :customer_documents, :allow_destroy => true
  accepts_nested_attributes_for :people_contacts, :allow_destroy => true
  scope :all_customer_count, -> {where( "id is NOT NULL")}
end
