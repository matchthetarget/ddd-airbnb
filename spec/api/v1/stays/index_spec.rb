require "rails_helper"

RSpec.describe "stays#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stays", params: params
  end

  describe "basic fetch" do
    let!(:stay1) { create(:stay) }
    let!(:stay2) { create(:stay) }

    it "works" do
      expect(StayResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["stays"])
      expect(d.map(&:id)).to match_array([stay1.id, stay2.id])
    end
  end
end
