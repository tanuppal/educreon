class AddColumnToOrderBillTo < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_bill_tos, :order, foreign_key: true
  end
end
