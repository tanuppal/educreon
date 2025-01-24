class CustomerTerm < ApplicationRecord
	has_one :customer, :dependent => :destroy
	validates :name, uniqueness: true
end
