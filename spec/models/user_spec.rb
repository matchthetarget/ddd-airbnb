require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:interactions_b) }

    it { should have_many(:interactions_a) }

    it { should have_many(:lines) }

    it { should have_many(:user_rooms) }

    it { should have_many(:rooms) }
  end

  describe "InDirect Associations" do
    it { should have_many(:senders) }

    it { should have_many(:recipients) }

    it { should have_many(:user_user_rooms) }

    it { should have_many(:locations) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
