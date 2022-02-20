class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :likes,
             dependent: :destroy

  has_many   :recieved_messages,
             class_name: "Message",
             foreign_key: "recipient_id",
             dependent: :destroy

  has_many   :sent_messages,
             class_name: "Message",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :stays,
             foreign_key: "guest_id",
             dependent: :destroy

  has_many   :rooms,
             foreign_key: "host_id",
             dependent: :destroy

  # Indirect associations

  has_many   :stayed_rooms,
             through: :stays,
             source: :room

  has_many   :liked_rooms,
             through: :likes,
             source: :room

has_many(:recipients, through: :sent_messages, source: :recipient)
  has_many(:senders, through: :recieved_messages, source: :sender)
  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
