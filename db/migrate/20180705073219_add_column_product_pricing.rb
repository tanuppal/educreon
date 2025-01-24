class AddColumnProductPricing < ActiveRecord::Migration[5.1]
  def change
  	add_column :product_pricings, :sale_status, :boolean, :default=>true
  end
end
