class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :body
      t.integer :room_id

      t.timestamps
    end
  end
end
