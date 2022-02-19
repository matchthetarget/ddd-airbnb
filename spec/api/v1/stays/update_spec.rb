require "rails_helper"

RSpec.describe "stays#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/stays/#{stay.id}", payload
  end

  describe "basic update" do
    let!(:stay) { create(:stay) }

    let(:payload) do
      {
        data: {
          id: stay.id.to_s,
          type: "stays",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(StayResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { stay.reload.attributes }
    end
  end
end
