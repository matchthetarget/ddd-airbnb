require "rails_helper"

RSpec.describe InteractionResource, type: :resource do
  describe "serialization" do
    let!(:interaction) { create(:interaction) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(interaction.id)
      expect(data.jsonapi_type).to eq("interactions")
    end
  end

  describe "filtering" do
    let!(:interaction1) { create(:interaction) }
    let!(:interaction2) { create(:interaction) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: interaction2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([interaction2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:interaction1) { create(:interaction) }
      let!(:interaction2) { create(:interaction) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      interaction1.id,
                                      interaction2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      interaction2.id,
                                      interaction1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
