class AddRecipientReferenceToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interactions, :users, column: :recipient_id
    add_index :interactions, :recipient_id
    change_column_null :interactions, :recipient_id, false
  end
end
