class RemoveColumnFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :company, foreign_key: true
  end
end
