class Receiving < ApplicationRecord
	has_many :receiving_products, :dependent => :destroy


	accepts_nested_attributes_for :receiving_products, :allow_destroy => true, reject_if: proc { |attrr| attrr['product_id'].blank?}
end