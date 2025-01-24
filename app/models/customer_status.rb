class CustomerStatus < ApplicationRecord
	has_one :customer, :dependent => :destroy
end
