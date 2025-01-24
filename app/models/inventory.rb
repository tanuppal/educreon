class Inventory < ApplicationRecord
	belongs_to :product,required: false
	validates :year_placed_in_svc, presence: true
	validates :depreciation_year, presence: true
end