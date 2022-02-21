require "rails_helper"

RSpec.describe "user_rooms#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_rooms", params: params
  end

  describe "basic fetch" do
    let!(:user_room1) { create(:user_room) }
    let!(:user_room2) { create(:user_room) }

    it "works" do
      expect(UserRoomResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["user_rooms"])
      expect(d.map(&:id)).to match_array([user_room1.id, user_room2.id])
    end
  end
end
