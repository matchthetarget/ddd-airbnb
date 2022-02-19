class PhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :room_id, :integer
  attribute :url, :string

  # Direct associations

  belongs_to :room

  # Indirect associations
end
