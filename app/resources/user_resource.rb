class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string

  # Direct associations

  has_many   :interactions_b,
             resource: InteractionResource,
             foreign_key: :recipient_id

  has_many   :interactions_a,
             resource: InteractionResource,
             foreign_key: :sender_id

  has_many   :lines

  has_many   :user_rooms,
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

  many_to_many :user_user_rooms,
               resource: RoomResource

  many_to_many :locations,
               resource: RoomResource

  filter :sender_id, :integer do
    eq do |scope, value|
      scope.eager_load(:senders).where(interactions: { sender_id: value })
    end
  end

  filter :recipient_id, :integer do
    eq do |scope, value|
      scope.eager_load(:recipients).where(interactions: { recipient_id: value })
    end
  end
end
