class OrderPayment < ApplicationRecord
  belongs_to :order
  belongs_to :order_payment_mode, required: false
  has_one :credit_card_detail, dependent: :destroy
  validates :order_payment_mode_id, presence: true

  accepts_nested_attributes_for :credit_card_detail, :allow_destroy => true

end
