class CreditCardDetail < ApplicationRecord
	belongs_to :order_payment,required: false
end
