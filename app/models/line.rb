class Line < ApplicationRecord
  # Direct associations

  belongs_to :location,
             class_name: "Room"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
