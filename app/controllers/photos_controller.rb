class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show edit update destroy]

  def index
    @q = Photo.ransack(params[:q])
    @photos = @q.result(distinct: true).includes(:room).page(params[:page]).per(10)
  end

  def show; end

  def new
    @photo = Photo.new
  end

  def edit; end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      message = "Photo was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @photo, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    message = "Photo was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to photos_url, notice: message
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:room_id, :url)
  end
end
