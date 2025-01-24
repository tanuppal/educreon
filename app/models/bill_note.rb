class BillNote < ApplicationRecord
  belongs_to :bill, required: false
end
