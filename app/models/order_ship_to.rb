class OrderShipTo < ApplicationRecord
  belongs_to :customer_location,required: false
  belongs_to :country,required: false
  belongs_to :state,required: false
  belongs_to :city,required: false
  
end
