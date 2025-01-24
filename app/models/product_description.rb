class ProductDescription < ApplicationRecord
  belongs_to :product,required: false
end
