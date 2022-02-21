require "rails_helper"

RSpec.describe "user_rooms#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_rooms/#{user_room.id}", payload
  end

  describe "basic update" do
    let!(:user_room) { create(:user_room) }

    let(:payload) do
      {
        data: {
          id: user_room.id.to_s,
          type: "user_rooms",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UserRoomResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { user_room.reload.attributes }
    end
  end
end
