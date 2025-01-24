class AddColumnsCustomerTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :customers, :active_status, :boolean, :default=>true
  end
end
