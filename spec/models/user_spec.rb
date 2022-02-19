require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:likes) }

    it { should have_many(:recieved_messages) }

    it { should have_many(:sent_messages) }

    it { should have_many(:stays) }

    it { should have_many(:rooms) }

    end

    describe "InDirect Associations" do

    it { should have_many(:liked_rooms) }

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    end
end
