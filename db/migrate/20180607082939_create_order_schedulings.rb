class CreateOrderSchedulings < ActiveRecord::Migration[5.1]
  def change
    create_table :order_schedulings do |t|
      t.date :rental_prep
      t.date :rental_picup
      t.date :rental_return
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
