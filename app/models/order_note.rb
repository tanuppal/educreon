class OrderNote < ApplicationRecord
  belongs_to :order, required: false
end
