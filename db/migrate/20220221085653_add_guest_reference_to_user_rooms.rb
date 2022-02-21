class AddGuestReferenceToUserRooms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_rooms, :users, column: :guest_id
    add_index :user_rooms, :guest_id
    change_column_null :user_rooms, :guest_id, false
  end
end
