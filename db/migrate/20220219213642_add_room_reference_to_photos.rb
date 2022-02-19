class AddRoomReferenceToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :photos, :rooms
    add_index :photos, :room_id
    change_column_null :photos, :room_id, false
  end
end
