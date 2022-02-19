json.extract! photo, :id, :room_id, :url, :created_at, :updated_at
json.url photo_url(photo, format: :json)
