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
    "Trip at #{room.name} from #{check_in.strftime("%b %d, %Y")} to #{check_out.strftime("%b %d, %Y")}"
  end
end
