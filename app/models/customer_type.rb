class CustomerType < ApplicationRecord
	has_one :customer, :dependent => :destroy
end
