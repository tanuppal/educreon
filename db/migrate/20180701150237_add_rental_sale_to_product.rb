class AddRentalSaleToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :rental_sale, :string
  end
end
