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

  has_many :senders, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.senders.map(&:id))
      end
    end
  end

  has_many :recipients, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.recipients.map(&:id))
      end
    end
  end

  many_to_many :stayed_rooms,
               resource: RoomResource

  many_to_many :liked_rooms,
               resource: RoomResource

  filter :sender_id, :integer do
    eq do |scope, value|
      scope.eager_load(:senders).where(messages: { sender_id: value })
    end
  end

  filter :recipient_id, :integer do
    eq do |scope, value|
      scope.eager_load(:recipients).where(messages: { recipient_id: value })
    end
  end
end
