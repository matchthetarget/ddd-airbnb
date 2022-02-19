class AddRecipientReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :recipient_id
    add_index :messages, :recipient_id
    change_column_null :messages, :recipient_id, false
  end
end
