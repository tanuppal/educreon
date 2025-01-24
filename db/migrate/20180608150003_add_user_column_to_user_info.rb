class AddUserColumnToUserInfo < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_infos, :user, foreign_key: true
    add_column :user_infos, :privilege_set, :string
  end
end
