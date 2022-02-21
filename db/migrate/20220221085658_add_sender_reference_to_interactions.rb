class AddSenderReferenceToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interactions, :users, column: :sender_id
    add_index :interactions, :sender_id
    change_column_null :interactions, :sender_id, false
  end
end
