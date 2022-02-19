class StaysController < ApplicationController
  before_action :set_stay, only: %i[show edit update destroy]

  # GET /stays
  def index
    @q = Stay.ransack(params[:q])
    @stays = @q.result(distinct: true).includes(:guest,
                                                :room).page(params[:page]).per(10)
  end

  # GET /stays/1
  def show; end

  # GET /stays/new
  def new
    @stay = Stay.new
  end

  # GET /stays/1/edit
  def edit; end

  # POST /stays
  def create
    @stay = Stay.new(stay_params)

    if @stay.save
      message = "Stay was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @stay, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /stays/1
  def update
    if @stay.update(stay_params)
      redirect_to @stay, notice: "Stay was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /stays/1
  def destroy
    @stay.destroy
    message = "Stay was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to stays_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stay
    @stay = Stay.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def stay_params
    params.require(:stay).permit(:guest_id, :room_id, :check_in, :check_out,
                                 :approved)
  end
end
