class Room < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => true

  validates :number_of_bedrooms, :presence => true

  # Scopes

  def to_s
    name
  end

end
