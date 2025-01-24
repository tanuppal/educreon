class ProductPricing < ApplicationRecord
  belongs_to :vendor, required: false
  belongs_to :product, required: false

  validates :cost,presence: true
  validates :price,presence: true

end
