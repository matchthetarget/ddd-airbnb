require 'rails_helper'

RSpec.describe Stay, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:room) }

    it { should belong_to(:guest) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:check_in) }

    it { should validate_presence_of(:check_out) }

    end
end
