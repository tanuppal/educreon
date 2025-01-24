class CreateCompanyRateFactors < ActiveRecord::Migration[5.1]
  def change
    create_table :company_rate_factors do |t|
      t.string :label
      t.string :day
      t.string :factor
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
