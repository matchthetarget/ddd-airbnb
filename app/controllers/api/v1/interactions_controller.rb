class Api::V1::InteractionsController < Api::V1::GraphitiController
  def index
    interactions = InteractionResource.all(params)
    respond_with(interactions)
  end

  def show
    interaction = InteractionResource.find(params)
    respond_with(interaction)
  end

  def create
    interaction = InteractionResource.build(params)

    if interaction.save
      render jsonapi: interaction, status: :created
    else
      render jsonapi_errors: interaction
    end
  end

  def update
    interaction = InteractionResource.find(params)

    if interaction.update_attributes
      render jsonapi: interaction
    else
      render jsonapi_errors: interaction
    end
  end

  def destroy
    interaction = InteractionResource.find(params)

    if interaction.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: interaction
    end
  end
end
