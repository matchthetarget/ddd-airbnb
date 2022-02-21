require "rails_helper"

RSpec.describe "interactions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/interactions/#{interaction.id}"
  end

  describe "basic destroy" do
    let!(:interaction) { create(:interaction) }

    it "updates the resource" do
      expect(InteractionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Interaction.count }.by(-1)
      expect { interaction.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
