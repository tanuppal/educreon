class CreateProductRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :product_rentals do |t|
      t.references :product, foreign_key: true
      t.float :day3
      t.float :day2
      t.float :week
      t.float :depreciation_year
      t.float :estimated_rental_days_per_year
      t.float :estimated_daily_cost

      t.timestamps
    end
  end
end
