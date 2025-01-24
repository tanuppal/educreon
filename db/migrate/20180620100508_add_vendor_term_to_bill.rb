class AddVendorTermToBill < ActiveRecord::Migration[5.1]
  def change
    add_reference :bills, :vendor_term, foreign_key: true
  end
end
