class CompanyDefault < ApplicationRecord
  belongs_to :activity_type, required: false
  belongs_to :customer_shipping, required: false
  belongs_to :company, required: false
  validates :sales_tax_rate, presence: true
  validates :customer_shipping_id, presence: true
  validates :shipping_charge, presence: true

end
