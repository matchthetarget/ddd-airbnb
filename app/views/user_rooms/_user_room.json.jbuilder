json.extract! user_room, :id, :guest_id, :room_id, :check_in, :check_out,
              :approved, :created_at, :updated_at
json.url user_room_url(user_room, format: :json)
