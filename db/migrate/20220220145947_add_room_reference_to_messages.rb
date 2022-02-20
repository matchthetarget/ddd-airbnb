class AddRoomReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :rooms
    add_index :messages, :room_id
    change_column_null :messages, :room_id, false
  end
end
