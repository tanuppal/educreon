class CreateCustomerShippings < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_shippings do |t|
      t.string :name

      t.timestamps
    end
  end
end
