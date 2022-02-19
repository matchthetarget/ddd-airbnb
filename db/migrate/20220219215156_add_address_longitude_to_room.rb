class AddAddressLongitudeToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :address_longitude, :float
  end
end
