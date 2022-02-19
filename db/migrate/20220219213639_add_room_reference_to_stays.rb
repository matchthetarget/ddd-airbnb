class AddRoomReferenceToStays < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :stays, :rooms
    add_index :stays, :room_id
    change_column_null :stays, :room_id, false
  end
end
