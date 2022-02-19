require "rails_helper"

RSpec.describe "stays#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/stays/#{stay.id}"
  end

  describe "basic destroy" do
    let!(:stay) { create(:stay) }

    it "updates the resource" do
      expect(StayResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Stay.count }.by(-1)
      expect { stay.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
