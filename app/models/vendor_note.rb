class VendorNote < ApplicationRecord
  belongs_to :vendor, required: false
end
