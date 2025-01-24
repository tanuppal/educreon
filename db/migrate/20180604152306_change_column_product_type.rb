class ChangeColumnProductType < ActiveRecord::Migration[5.1]
  def change
  	rename_column :product_types, :type, :name
  end
end
