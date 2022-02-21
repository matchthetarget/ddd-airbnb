require "rails_helper"

RSpec.describe UserRoomResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "user_rooms",
          attributes: {},
        },
      }
    end

    let(:instance) do
      UserRoomResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { UserRoom.count }.by(1)
    end
  end

  describe "updating" do
    let!(:user_room) { create(:user_room) }

    let(:payload) do
      {
        data: {
          id: user_room.id.to_s,
          type: "user_rooms",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      UserRoomResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { user_room.reload.updated_at }
      # .and change { user_room.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:user_room) { create(:user_room) }

    let(:instance) do
      UserRoomResource.find(id: user_room.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { UserRoom.count }.by(-1)
    end
  end
end
