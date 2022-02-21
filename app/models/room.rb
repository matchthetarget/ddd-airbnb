require "open-uri"
class Room < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if address.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :interactions,
             dependent: :destroy

  has_many   :lines,
             foreign_key: "location_id",
             dependent: :destroy

  has_many   :photos,
             dependent: :destroy

  has_many   :user_rooms,
             dependent: :destroy

  belongs_to :host,
             class_name: "User"

  # Indirect associations

  has_many   :guests,
             through: :user_rooms,
             source: :guest

  has_many   :users,
             through: :lines,
             source: :user

  # Validations

  validates :name, presence: true

  validates :number_of_bedrooms, presence: true

  # Scopes

  def to_s
    name
  end
end
