class Product < ApplicationRecord

  validates :barcode, presence: true
  validates_uniqueness_of :barcode

  belongs_to :product_type, required: false
  belongs_to :product_category, required: false
  belongs_to :product_status, required: false
  belongs_to :kit_item, required: false
  belongs_to :track_barcode, required: false
  belongs_to :product_kind_category, required: false
  
  has_one :product_pricing, :dependent => :destroy
  has_many :product_images, :dependent => :destroy
  has_many :product_descriptions,:dependent => :destroy
  has_one :inventory,:dependent => :destroy
  has_one :product_rental,:dependent => :destroy
  has_many :product_sales,:dependent => :destroy
  has_many :product_kit_items,:dependent => :destroy
  has_many :order_items
  has_many :product_track_codes,:dependent => :destroy
  has_many :order_schedulings, :dependent => :destroy
  has_many :receiving_products, :dependent => :destroy

  scope :all_product_count, -> {where( "id is NOT NULL")}

  validates :name, presence: true
  validates :barcode, presence: true
  validates :product_category_id, presence: true
  validates :product_kind_category_id, presence: true
  validates :product_status_id, presence: true

  accepts_nested_attributes_for :product_pricing, :allow_destroy => true
  accepts_nested_attributes_for :product_images, :allow_destroy => true
  accepts_nested_attributes_for :product_descriptions, :allow_destroy => true
  accepts_nested_attributes_for :inventory, :allow_destroy => true
  accepts_nested_attributes_for :product_rental, :allow_destroy => true
  accepts_nested_attributes_for :product_sales, :allow_destroy => true
  accepts_nested_attributes_for :product_kit_items, :allow_destroy => true
  accepts_nested_attributes_for :product_track_codes, :allow_destroy => true

end
