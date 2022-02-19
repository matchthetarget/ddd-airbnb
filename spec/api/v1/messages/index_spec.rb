require "rails_helper"

RSpec.describe "messages#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/messages", params: params
  end

  describe "basic fetch" do
    let!(:message1) { create(:message) }
    let!(:message2) { create(:message) }

    it "works" do
      expect(MessageResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["messages"])
      expect(d.map(&:id)).to match_array([message1.id, message2.id])
    end
  end
end
