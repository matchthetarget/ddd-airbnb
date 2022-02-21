require "rails_helper"

RSpec.describe "interactions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interactions", params: params
  end

  describe "basic fetch" do
    let!(:interaction1) { create(:interaction) }
    let!(:interaction2) { create(:interaction) }

    it "works" do
      expect(InteractionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["interactions"])
      expect(d.map(&:id)).to match_array([interaction1.id, interaction2.id])
    end
  end
end
