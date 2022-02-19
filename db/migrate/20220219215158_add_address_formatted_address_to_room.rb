class AddAddressFormattedAddressToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :address_formatted_address, :string
  end
end
