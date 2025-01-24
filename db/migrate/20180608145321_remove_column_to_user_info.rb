class RemoveColumnToUserInfo < ActiveRecord::Migration[5.1]
  def change
    remove_reference :user_infos, :privilege_set, foreign_key: true
  end
end
