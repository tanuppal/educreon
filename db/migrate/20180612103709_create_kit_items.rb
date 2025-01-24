class CreateKitItems < ActiveRecord::Migration[5.1]
  def change
    create_table :kit_items do |t|
      t.string :name
      t.float :quantity

      t.timestamps
    end
  end
end
