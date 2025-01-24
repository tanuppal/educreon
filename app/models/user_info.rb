class UserInfo < ApplicationRecord
  belongs_to :user, required: false
end
