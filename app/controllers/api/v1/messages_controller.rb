class Api::V1::MessagesController < Api::V1::GraphitiController
  def index
    messages = MessageResource.all(params)
    respond_with(messages)
  end

  def show
    message = MessageResource.find(params)
    respond_with(message)
  end

  def create
    message = MessageResource.build(params)

    if message.save
      render jsonapi: message, status: :created
    else
      render jsonapi_errors: message
    end
  end

  def update
    message = MessageResource.find(params)

    if message.update_attributes
      render jsonapi: message
    else
      render jsonapi_errors: message
    end
  end

  def destroy
    message = MessageResource.find(params)

    if message.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: message
    end
  end
end
