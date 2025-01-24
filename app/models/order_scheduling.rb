class OrderScheduling < ApplicationRecord
  	belongs_to :order,required: false
  	belongs_to :product,required: false
	# validates :rental_prep, presence: true
	# validates :rental_picup, presence: true
	# validates :rental_return, presence: true
  	scope :all_scheduling , -> (rental_prep){ where( rental_prep: rental_prep )}
end
