class AddLocationReferenceToLines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :lines, :rooms, column: :location_id
    add_index :lines, :location_id
    change_column_null :lines, :location_id, false
  end
end
