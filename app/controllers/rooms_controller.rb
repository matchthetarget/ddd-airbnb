class RoomsController < ApplicationController
  before_action :current_user_must_be_room_host,
                only: %i[edit update destroy]

  before_action :set_room, only: %i[show edit update destroy]

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).includes(:host, :stays, :photos,
                                                :likes, :fans, :guests).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@rooms.where.not(address_latitude: nil)) do |room, marker|
      marker.lat room.address_latitude
      marker.lng room.address_longitude
    end
  end

  def likes
    @rooms = current_user.liked_rooms.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@rooms.where.not(address_latitude: nil)) do |room, marker|
      marker.lat room.address_latitude
      marker.lng room.address_longitude
    end
  end

  def show
    @like = Like.new
    @photo = Photo.new
    @stay = Stay.new
  end

  def new
    @room = Room.new
  end

  def edit; end

  def create
    @room = Room.new(room_params)

    if @room.save
      message = "Room was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @room, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Room was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    message = "Room was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to rooms_url, notice: message
    end
  end

  private

  def current_user_must_be_room_host
    set_room
    unless current_user == @room.host
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:host_id, :number_of_bedrooms, :name,
                                 :description, :cost_per_night, :number_of_bathrooms, :address)
  end
end
