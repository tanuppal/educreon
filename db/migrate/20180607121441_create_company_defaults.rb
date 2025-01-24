class CreateCompanyDefaults < ActiveRecord::Migration[5.1]
  def change
    create_table :company_defaults do |t|
      t.references :activity_type, foreign_key: true
      t.float :sales_tax_rate
      t.references :customer_shipping, foreign_key: true
      t.float :shipping_charge
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
