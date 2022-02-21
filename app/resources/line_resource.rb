class LineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :location_id, :integer

  # Direct associations

  belongs_to :location,
             resource: RoomResource

  belongs_to :user

  # Indirect associations
end
