class Api::V1::LinesController < Api::V1::GraphitiController
  def index
    lines = LineResource.all(params)
    respond_with(lines)
  end

  def show
    line = LineResource.find(params)
    respond_with(line)
  end

  def create
    line = LineResource.build(params)

    if line.save
      render jsonapi: line, status: :created
    else
      render jsonapi_errors: line
    end
  end

  def update
    line = LineResource.find(params)

    if line.update_attributes
      render jsonapi: line
    else
      render jsonapi_errors: line
    end
  end

  def destroy
    line = LineResource.find(params)

    if line.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: line
    end
  end
end
