class OrderPaymentMode < ApplicationRecord
	has_one :order_payment, dependent: :destroy
end
