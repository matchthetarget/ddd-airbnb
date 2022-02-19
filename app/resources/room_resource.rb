class RoomResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :host_id, :integer
  attribute :number_of_bedrooms, :integer
  attribute :name, :string
  attribute :description, :string
  attribute :cost_per_night, :float
  attribute :number_of_bathrooms, :string

  # Direct associations

  has_many   :stays

  belongs_to :host,
             resource: UserResource

  # Indirect associations

end
