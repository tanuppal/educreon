class CreateUserInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_infos do |t|
      t.string :account_name
      t.string :display_name
      t.references :privilege_set, foreign_key: true
      t.boolean :is_sales_person

      t.timestamps
    end
  end
end
