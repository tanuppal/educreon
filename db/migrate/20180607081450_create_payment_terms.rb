class CreatePaymentTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_terms do |t|
      t.string :name

      t.timestamps
    end
  end
end
