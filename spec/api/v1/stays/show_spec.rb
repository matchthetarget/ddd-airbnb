require 'rails_helper'

RSpec.describe "stays#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/stays/#{stay.id}", params: params
  end

  describe 'basic fetch' do
    let!(:stay) { create(:stay) }

    it 'works' do
      expect(StayResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('stays')
      expect(d.id).to eq(stay.id)
    end
  end
end
