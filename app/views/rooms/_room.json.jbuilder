json.extract! room, :id, :host_id, :number_of_bedrooms, :name, :description, :cost_per_night, :number_of_bathrooms, :created_at, :updated_at
json.url room_url(room, format: :json)
