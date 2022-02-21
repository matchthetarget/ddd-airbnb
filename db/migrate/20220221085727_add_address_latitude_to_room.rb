class AddAddressLatitudeToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :address_latitude, :float
  end
end
