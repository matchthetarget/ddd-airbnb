require "rails_helper"

RSpec.describe Room, type: :model do
  describe "Direct Associations" do
    it { should have_many(:interactions) }

    it { should have_many(:lines) }

    it { should have_many(:photos) }

    it { should have_many(:user_rooms) }

    it { should belong_to(:host) }
  end

  describe "InDirect Associations" do
    it { should have_many(:guests) }

    it { should have_many(:users) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:number_of_bedrooms) }
  end
end
