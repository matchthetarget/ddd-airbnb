require 'rails_helper'

RSpec.describe Room, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:number_of_bedrooms) }

    end
end
