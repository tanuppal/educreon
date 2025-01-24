class OrderBillTo < ApplicationRecord
  belongs_to :customer_location,required: false
  belongs_to :country,required: false
  belongs_to :city,required: false
  belongs_to :order
end
