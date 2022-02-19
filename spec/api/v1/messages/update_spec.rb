require 'rails_helper'

RSpec.describe "messages#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/messages/#{message.id}", payload
  end

  describe 'basic update' do
    let!(:message) { create(:message) }

    let(:payload) do
      {
        data: {
          id: message.id.to_s,
          type: 'messages',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(MessageResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { message.reload.attributes }
    end
  end
end
