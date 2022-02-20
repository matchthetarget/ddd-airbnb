class Stay < ApplicationRecord
  # Direct associations

  belongs_to :room

  belongs_to :guest,
             class_name: "User"

  # Indirect associations

  # Validations

  validates :check_in, presence: true

  validates :check_out, presence: true

  # Scopes

  def to_s
    "Stay from #{check_in} to #{check_out}"
  end
end
