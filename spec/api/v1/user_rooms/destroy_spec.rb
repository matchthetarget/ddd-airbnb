require "rails_helper"

RSpec.describe "user_rooms#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_rooms/#{user_room.id}"
  end

  describe "basic destroy" do
    let!(:user_room) { create(:user_room) }

    it "updates the resource" do
      expect(UserRoomResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { UserRoom.count }.by(-1)
      expect { user_room.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
