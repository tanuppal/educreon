class ProductSale < ApplicationRecord
  belongs_to :product, required: false

end
