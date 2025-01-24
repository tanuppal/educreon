class CustomerShipping < ApplicationRecord
	has_one :customer, :dependent => :destroy
	has_one :company_default, :dependent => :destroy
end
