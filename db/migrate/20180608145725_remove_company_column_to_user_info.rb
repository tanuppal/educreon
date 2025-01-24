class RemoveCompanyColumnToUserInfo < ActiveRecord::Migration[5.1]
  def change
    remove_reference :user_infos, :company, foreign_key: true
  end
end
