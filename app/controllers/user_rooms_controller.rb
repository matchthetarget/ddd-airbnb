class UserRoomsController < ApplicationController
  before_action :set_user_room, only: %i[show edit update destroy]

  def index
    @q = UserRoom.ransack(params[:q])
    @user_rooms = @q.result(distinct: true).includes(:guest,
                                                     :room).page(params[:page]).per(10)
  end

  def show; end

  def new
    @user_room = UserRoom.new
  end

  def edit; end

  def create
    @user_room = UserRoom.new(user_room_params)

    if @user_room.save
      message = "Your trip is pending approval."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @user_room, notice: message
      end
    else
      render :new
    end
  end
  
  def update
    if @user_room.update(user_room_params)
      redirect_back fallback_location: request.referer, notice: "User room was successfully updated."
      # redirect_to @user_room, notice: "User room was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_room.destroy
    message = "Trip was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to user_rooms_url, notice: message
    end
  end

  private

  def set_user_room
    @user_room = UserRoom.find(params[:id])
  end

  def user_room_params
    params.require(:user_room).permit(:guest_id, :room_id, :check_in,
                                      :check_out, :approved)
  end
end
