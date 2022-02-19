class AddGuestReferenceToStays < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :stays, :users, column: :guest_id
    add_index :stays, :guest_id
    change_column_null :stays, :guest_id, false
  end
end
