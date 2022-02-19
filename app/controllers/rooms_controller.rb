class RoomsController < ApplicationController
  before_action :current_user_must_be_room_host, only: [:edit, :update, :destroy] 

  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(:distinct => true).includes(:host, :stays, :photos, :likes, :fans, :guests).page(params[:page]).per(10)
  end

  # GET /rooms/1
  def show
    @like = Like.new
    @photo = Photo.new
    @stay = Stay.new
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      message = 'Room was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @room, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    message = "Room was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to rooms_url, notice: message
    end
  end


  private

  def current_user_must_be_room_host
    set_room
    unless current_user == @room.host
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_params
      params.require(:room).permit(:host_id, :number_of_bedrooms, :name, :description, :cost_per_night, :number_of_bathrooms)
    end
end
