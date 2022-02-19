class Stay < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :check_in, :presence => true

  validates :check_out, :presence => true

  # Scopes

  def to_s
    check_in
  end

end
