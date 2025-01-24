class OrderItem < ApplicationRecord
  belongs_to :order,required: false
  belongs_to :product,required: false
  belongs_to :product_category,required: false
end
