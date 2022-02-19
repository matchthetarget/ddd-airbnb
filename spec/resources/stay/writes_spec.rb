require 'rails_helper'

RSpec.describe StayResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'stays',
          attributes: { }
        }
      }
    end

    let(:instance) do
      StayResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Stay.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:stay) { create(:stay) }

    let(:payload) do
      {
        data: {
          id: stay.id.to_s,
          type: 'stays',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StayResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { stay.reload.updated_at }
      # .and change { stay.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:stay) { create(:stay) }

    let(:instance) do
      StayResource.find(id: stay.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Stay.count }.by(-1)
    end
  end
end
