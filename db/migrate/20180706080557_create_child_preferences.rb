class CreateChildPreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :child_preferences do |t|
      t.references :user_preference_group, foreign_key: true
      t.string :controller_name

      t.timestamps
    end
  end
end
