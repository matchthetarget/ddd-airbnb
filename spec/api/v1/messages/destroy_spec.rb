require 'rails_helper'

RSpec.describe "messages#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/messages/#{message.id}"
  end

  describe 'basic destroy' do
    let!(:message) { create(:message) }

    it 'updates the resource' do
      expect(MessageResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Message.count }.by(-1)
      expect { message.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
