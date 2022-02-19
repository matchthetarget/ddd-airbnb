require "rails_helper"

RSpec.describe MessageResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "messages",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MessageResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Message.count }.by(1)
    end
  end

  describe "updating" do
    let!(:message) { create(:message) }

    let(:payload) do
      {
        data: {
          id: message.id.to_s,
          type: "messages",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MessageResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { message.reload.updated_at }
      # .and change { message.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:message) { create(:message) }

    let(:instance) do
      MessageResource.find(id: message.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Message.count }.by(-1)
    end
  end
end
