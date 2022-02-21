require "rails_helper"

RSpec.describe InteractionResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "interactions",
          attributes: {},
        },
      }
    end

    let(:instance) do
      InteractionResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Interaction.count }.by(1)
    end
  end

  describe "updating" do
    let!(:interaction) { create(:interaction) }

    let(:payload) do
      {
        data: {
          id: interaction.id.to_s,
          type: "interactions",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      InteractionResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { interaction.reload.updated_at }
      # .and change { interaction.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:interaction) { create(:interaction) }

    let(:instance) do
      InteractionResource.find(id: interaction.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Interaction.count }.by(-1)
    end
  end
end
