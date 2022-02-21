require "rails_helper"

RSpec.describe UserRoomResource, type: :resource do
  describe "serialization" do
    let!(:user_room) { create(:user_room) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_room.id)
      expect(data.jsonapi_type).to eq("user_rooms")
    end
  end

  describe "filtering" do
    let!(:user_room1) { create(:user_room) }
    let!(:user_room2) { create(:user_room) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: user_room2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([user_room2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:user_room1) { create(:user_room) }
      let!(:user_room2) { create(:user_room) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_room1.id,
                                      user_room2.id,
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
                                      user_room2.id,
                                      user_room1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
