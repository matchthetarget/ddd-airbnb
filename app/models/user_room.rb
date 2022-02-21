class UserRoom < ApplicationRecord
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
    check_in
  end
end
