class Photo < ApplicationRecord
  mount_base64_uploader :url, UrlUploader

  # Direct associations

  belongs_to :room

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    room.to_s
  end

end
