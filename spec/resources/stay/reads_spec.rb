require "rails_helper"

RSpec.describe StayResource, type: :resource do
  describe "serialization" do
    let!(:stay) { create(:stay) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(stay.id)
      expect(data.jsonapi_type).to eq("stays")
    end
  end

  describe "filtering" do
    let!(:stay1) { create(:stay) }
    let!(:stay2) { create(:stay) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: stay2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([stay2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:stay1) { create(:stay) }
      let!(:stay2) { create(:stay) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      stay1.id,
                                      stay2.id,
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
                                      stay2.id,
                                      stay1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
