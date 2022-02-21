class LinesController < ApplicationController
  before_action :set_line, only: %i[show edit update destroy]

  def index
    @q = Line.ransack(params[:q])
    @lines = @q.result(distinct: true).includes(:user,
                                                :location).page(params[:page]).per(10)
  end

  def show; end

  def new
    @line = Line.new
  end

  def edit; end

  def create
    @line = Line.new(line_params)

    if @line.save
      message = "Line was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @line, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @line.update(line_params)
      redirect_to @line, notice: "Line was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @line.destroy
    message = "Line was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to lines_url, notice: message
    end
  end

  private

  def set_line
    @line = Line.find(params[:id])
  end

  def line_params
    params.require(:line).permit(:user_id, :location_id)
  end
end
