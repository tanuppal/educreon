class ChangeBooleanColumnFromVendorPeople < ActiveRecord::Migration[5.1]
  def change
  	change_column :vendor_people, :status, :string
  end
end
