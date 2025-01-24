class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.references :country, foreign_key: true
      t.references :state, foreign_key: true
      t.references :city, foreign_key: true
      t.string :pin_code
      t.string :phone
      t.string :fax
      t.string :email
      t.string :url
      t.attachment :logo

      t.timestamps
    end
  end
end
