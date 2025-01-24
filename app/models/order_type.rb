class OrderType < ApplicationRecord
	has_many :orders, :dependent => :destroy
end
