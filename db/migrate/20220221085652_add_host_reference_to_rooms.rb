class AddHostReferenceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rooms, :users, column: :host_id
    add_index :rooms, :host_id
    change_column_null :rooms, :host_id, false
  end
end
