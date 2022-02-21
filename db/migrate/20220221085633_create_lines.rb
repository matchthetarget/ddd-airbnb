class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
