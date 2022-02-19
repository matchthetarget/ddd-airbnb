class CreateStays < ActiveRecord::Migration[6.0]
  def change
    create_table :stays do |t|
      t.integer :guest_id
      t.integer :room_id
      t.date :check_in
      t.date :check_out
      t.boolean :approved

      t.timestamps
    end
  end
end
