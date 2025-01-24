class CreateCreditCardDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_card_details do |t|
      t.string :name
      t.integer :card_number, limit: 8
      t.string :date
      t.integer :card_cvc, limit: 4

      t.timestamps
    end
  end
end
