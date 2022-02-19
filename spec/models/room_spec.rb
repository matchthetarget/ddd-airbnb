require 'rails_helper'

RSpec.describe Room, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:likes) }

    it { should have_many(:photos) }

    it { should have_many(:stays) }

    it { should belong_to(:host) }

    end

    describe "InDirect Associations" do

    it { should have_many(:guests) }

    it { should have_many(:fans) }

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:number_of_bedrooms) }

    end
end
