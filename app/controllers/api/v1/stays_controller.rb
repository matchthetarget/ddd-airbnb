class Api::V1::StaysController < Api::V1::GraphitiController
  def index
    stays = StayResource.all(params)
    respond_with(stays)
  end

  def show
    stay = StayResource.find(params)
    respond_with(stay)
  end

  def create
    stay = StayResource.build(params)

    if stay.save
      render jsonapi: stay, status: :created
    else
      render jsonapi_errors: stay
    end
  end

  def update
    stay = StayResource.find(params)

    if stay.update_attributes
      render jsonapi: stay
    else
      render jsonapi_errors: stay
    end
  end

  def destroy
    stay = StayResource.find(params)

    if stay.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: stay
    end
  end
end
