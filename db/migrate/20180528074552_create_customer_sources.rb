class CreateCustomerSources < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_sources do |t|
      t.string :name

      t.timestamps
    end
  end
end
