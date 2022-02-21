class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]

  def index
    @q = Message.ransack(params[:q])
    @messages = @q.result(distinct: true).includes(:sender, :recipient,
                                                   :room).page(params[:page]).per(10)
  end

  def show; end

  def new
    @message = Message.new
    rid = params[:room_id]
    @room = Room.find(rid)
  end

  def edit; end

  def create
    @message = Message.new(message_params)

    if @message.save
      message = "Message was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        # redirect_back fallback_location: request.referer, notice: message
        redirect_to messages_url, notice: message
      else
        # redirect_to @message, notice:  message
        redirect_to messages_url, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: "Message was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    message = "Message was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      # redirect_back fallback_location: request.referer, notice: message
      redirect_to messages_url, notice: message
    else
      redirect_to messages_url, notice: message
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :body,
                                    :room_id)
  end
end
