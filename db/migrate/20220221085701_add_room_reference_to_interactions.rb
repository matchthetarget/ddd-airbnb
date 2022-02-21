class AddRoomReferenceToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interactions, :rooms
    add_index :interactions, :room_id
    change_column_null :interactions, :room_id, false
  end
end
