class BillStatus < ApplicationRecord
  has_one :bill, :dependent => :destroy	
end
