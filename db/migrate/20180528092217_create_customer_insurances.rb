class CreateCustomerInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_insurances do |t|
      t.string :provider
      t.float :coverage
      t.date :expired_by
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
