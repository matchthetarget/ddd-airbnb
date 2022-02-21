json.extract! interaction, :id, :sender_id, :recipient_id, :body, :room_id,
              :created_at, :updated_at
json.url interaction_url(interaction, format: :json)
