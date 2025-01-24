class VendorTerm < ApplicationRecord
	has_one :vendor, :dependent => :destroy
end
