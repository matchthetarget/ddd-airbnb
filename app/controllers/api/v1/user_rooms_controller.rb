class Api::V1::UserRoomsController < Api::V1::GraphitiController
  def index
    user_rooms = UserRoomResource.all(params)
    respond_with(user_rooms)
  end

  def show
    user_room = UserRoomResource.find(params)
    respond_with(user_room)
  end

  def create
    user_room = UserRoomResource.build(params)

    if user_room.save
      render jsonapi: user_room, status: :created
    else
      render jsonapi_errors: user_room
    end
  end

  def update
    user_room = UserRoomResource.find(params)

    if user_room.update_attributes
      render jsonapi: user_room
    else
      render jsonapi_errors: user_room
    end
  end

  def destroy
    user_room = UserRoomResource.find(params)

    if user_room.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: user_room
    end
  end
end
