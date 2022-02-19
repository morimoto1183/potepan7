class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :introduction
      t.string :address
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
