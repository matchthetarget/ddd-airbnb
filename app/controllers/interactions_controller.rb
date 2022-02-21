class InteractionsController < ApplicationController
  before_action :set_interaction, only: %i[show edit update destroy]

  def index
    @q = Interaction.ransack(params[:q])
    @interactions = @q.result(distinct: true).includes(:sender, :recipient,
                                                       :room).page(params[:page]).per(10)
  end

  def show; end

  def new
    @interaction = Interaction.new
    rid = params[:room_id]
    @room = Room.find(rid)
  end

  def edit; end

  def create
    @interaction = Interaction.new(interaction_params)

    if @interaction.save
      message = "Message was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        # redirect_back fallback_location: request.referer, notice: message
        redirect_to interactions_url, notice: message
      else
        # redirect_to @interaction, notice: message
        redirect_to interactions_url, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @interaction.update(interaction_params)
      redirect_to @interaction, notice: "Interaction was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @interaction.destroy
    message = "Interaction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to interactions_url, notice: message
    end
  end

  private

  def set_interaction
    @interaction = Interaction.find(params[:id])
  end

  def interaction_params
    params.require(:interaction).permit(:sender_id, :recipient_id, :body,
                                        :room_id)
  end
end
