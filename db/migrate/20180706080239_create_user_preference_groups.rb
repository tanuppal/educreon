class CreateUserPreferenceGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_preference_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
