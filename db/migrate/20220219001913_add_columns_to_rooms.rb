class AddColumnsToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :search, :string
    add_column :rooms, :search_area, :string
    add_column :rooms, :room_area, :string
  end
end
