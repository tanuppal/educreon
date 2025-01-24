class KitItem < ApplicationRecord
	has_many :products,dependent: :destroy
	has_many :products_kit_item,dependent: :destroy
	before_create :set_available_quantity

	def set_available_quantity
		self.available_quantity =self.quantity
	end
end
