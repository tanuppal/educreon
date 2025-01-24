class PrivilegeSet < ApplicationRecord
  belongs_to :user, required: false
  has_one :user_info, :dependent=> :destroy
end
