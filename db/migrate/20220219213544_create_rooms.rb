class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :host_id
      t.integer :number_of_bedrooms
      t.string :name
      t.string :description
      t.float :cost_per_night
      t.string :number_of_bathrooms

      t.timestamps
    end
  end
end
