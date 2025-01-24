class ProductRental < ApplicationRecord
  belongs_to :product, required: false

  has_many :product_pricing_rents, :dependent => :destroy

  accepts_nested_attributes_for :product_pricing_rents, :allow_destroy => true
end
