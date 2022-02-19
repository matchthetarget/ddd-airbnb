class StayResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :guest_id, :integer
  attribute :room_id, :integer
  attribute :check_in, :date
  attribute :check_out, :date
  attribute :approved, :boolean

  # Direct associations

  belongs_to :room

  belongs_to :guest,
             resource: UserResource

  # Indirect associations

end
