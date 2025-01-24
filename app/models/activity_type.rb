class ActivityType < ApplicationRecord
	has_one :company_default, :dependent => :destroy
end
