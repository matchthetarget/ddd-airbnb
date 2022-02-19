require "rails_helper"

RSpec.describe MessageResource, type: :resource do
  describe "serialization" do
    let!(:message) { create(:message) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(message.id)
      expect(data.jsonapi_type).to eq("messages")
    end
  end

  describe "filtering" do
    let!(:message1) { create(:message) }
    let!(:message2) { create(:message) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: message2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([message2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:message1) { create(:message) }
      let!(:message2) { create(:message) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      message1.id,
                                      message2.id,
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
                                      message2.id,
                                      message1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
