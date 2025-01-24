class ChangeDataTypeProductPricing < ActiveRecord::Migration[5.1]
  def change
  	def up
      change_column :product_pricings, :price, :float
      change_column :product_pricings, :cost, :float
  	end

		def down
		  change_column :product_pricings, :price, :string
		  change_column :product_pricings, :cost, :string
		end
  end
end
