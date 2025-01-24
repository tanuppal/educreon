class AddColumnToProductRental < ActiveRecord::Migration[5.1]
  def change
    add_column :product_rentals, :weekly, :float
  end
end
