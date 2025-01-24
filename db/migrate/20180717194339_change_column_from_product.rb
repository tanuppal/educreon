class ChangeColumnFromProduct < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :is_kit, :boolean, default: false
  end
end
