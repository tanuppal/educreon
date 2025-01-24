class RenameColumnNameProductRental < ActiveRecord::Migration[5.1]
  def change
  	rename_column :product_rentals, :week, :day1
  end
end
