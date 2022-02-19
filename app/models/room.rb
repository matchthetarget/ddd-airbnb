class Room < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  has_many   :stays,
             :dependent => :destroy

  belongs_to :host,
             :class_name => "User"

  # Indirect associations

  has_many   :guests,
             :through => :stays,
             :source => :guest

  has_many   :fans,
             :through => :likes,
             :source => :user

  # Validations

  validates :name, :presence => true

  validates :number_of_bedrooms, :presence => true

  # Scopes

  def to_s
    name
  end

end
