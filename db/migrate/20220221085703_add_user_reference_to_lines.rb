class AddUserReferenceToLines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :lines, :users
    add_index :lines, :user_id
    change_column_null :lines, :user_id, false
  end
end
