require "rails_helper"

RSpec.describe "messages#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/messages/#{message.id}", params: params
  end

  describe "basic fetch" do
    let!(:message) { create(:message) }

    it "works" do
      expect(MessageResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("messages")
      expect(d.id).to eq(message.id)
    end
  end
end
