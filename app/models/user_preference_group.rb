class UserPreferenceGroup < ApplicationRecord
	has_many :child_preferences
	accepts_nested_attributes_for :child_preferences, :allow_destroy => true
end
