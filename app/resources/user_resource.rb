class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string

  # Direct associations

  has_many   :likes

  has_many   :recieved_messages,
             resource: MessageResource,
             foreign_key: :recipient_id

  has_many   :sent_messages,
             resource: MessageResource,
             foreign_key: :sender_id

  has_many   :stays,
             foreign_key: :guest_id

  has_many   :rooms,
             foreign_key: :host_id

  # Indirect associations

  many_to_many :stayed_rooms,
               resource: RoomResource

  many_to_many :liked_rooms,
               resource: RoomResource
end
