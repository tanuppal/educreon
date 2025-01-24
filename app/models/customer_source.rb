class CustomerSource < ApplicationRecord
	has_one :customer, :dependent => :destroy
end
