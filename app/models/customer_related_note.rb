class CustomerRelatedNote < ApplicationRecord
  belongs_to :customer, required: false
end
