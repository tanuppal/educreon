class AddColumnToUserInfo < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_infos, :company, foreign_key: true
  end
end
