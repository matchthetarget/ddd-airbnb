json.extract! stay, :id, :guest_id, :room_id, :check_in, :check_out, :approved,
              :created_at, :updated_at
json.url stay_url(stay, format: :json)
