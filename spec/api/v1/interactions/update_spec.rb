require "rails_helper"

RSpec.describe "interactions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/interactions/#{interaction.id}", payload
  end

  describe "basic update" do
    let!(:interaction) { create(:interaction) }

    let(:payload) do
      {
        data: {
          id: interaction.id.to_s,
          type: "interactions",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(InteractionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { interaction.reload.attributes }
    end
  end
end
