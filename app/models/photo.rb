class Photo < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    room.to_s
  end

end
