class CreateRentalSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_settings do |t|
      t.string :name
      t.attachment :logo
      t.text :address

      t.timestamps
    end
  end
end
