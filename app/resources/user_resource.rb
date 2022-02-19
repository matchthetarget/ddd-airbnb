class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string

  # Direct associations

  has_many   :stays,
             foreign_key: :guest_id

  has_many   :rooms,
             foreign_key: :host_id

  # Indirect associations

end
