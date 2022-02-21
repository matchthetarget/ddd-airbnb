class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :interactions_b,
             class_name: "Interaction",
             foreign_key: "recipient_id",
             dependent: :destroy

  has_many   :interactions_a,
             class_name: "Interaction",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :lines,
             dependent: :destroy

  has_many   :user_rooms,
             foreign_key: "guest_id",
             dependent: :destroy

  has_many   :rooms,
             foreign_key: "host_id",
             dependent: :destroy

  # Indirect associations

  has_many   :senders,
             through: :interactions_b,
             source: :sender

  has_many   :recipients,
             through: :interactions_a,
             source: :recipient

  has_many   :user_user_rooms,
             through: :user_rooms,
             source: :room

  has_many   :locations,
             through: :lines,
             source: :location

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
