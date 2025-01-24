class AddReferencesToCreditCardDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :credit_card_details, :order_payment, foreign_key: true
  end
end
