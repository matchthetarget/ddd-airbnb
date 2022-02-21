require "rails_helper"

RSpec.describe "user_rooms#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_rooms/#{user_room.id}", params: params
  end

  describe "basic fetch" do
    let!(:user_room) { create(:user_room) }

    it "works" do
      expect(UserRoomResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("user_rooms")
      expect(d.id).to eq(user_room.id)
    end
  end
end
