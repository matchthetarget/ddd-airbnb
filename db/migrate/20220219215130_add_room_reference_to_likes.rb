class AddRoomReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :rooms
    add_index :likes, :room_id
    change_column_null :likes, :room_id, false
  end
end
