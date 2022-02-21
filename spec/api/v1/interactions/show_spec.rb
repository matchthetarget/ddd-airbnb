require "rails_helper"

RSpec.describe "interactions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interactions/#{interaction.id}", params: params
  end

  describe "basic fetch" do
    let!(:interaction) { create(:interaction) }

    it "works" do
      expect(InteractionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("interactions")
      expect(d.id).to eq(interaction.id)
    end
  end
end
