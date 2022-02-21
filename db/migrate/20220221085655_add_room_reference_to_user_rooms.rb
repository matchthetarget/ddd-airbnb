class AddRoomReferenceToUserRooms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_rooms, :rooms
    add_index :user_rooms, :room_id
    change_column_null :user_rooms, :room_id, false
  end
end
