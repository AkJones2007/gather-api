class GatheringsController < ApplicationController
  skip_before_action :authenticate

  # Index
  def index
    gatherings = Gathering.all
    render json: gatherings
  end

  # Show
  def show
    gathering = Gathering.find(params[:id])
    render json: gathering
  end

  # Create
  def create
    gathering = Gathering.new(gath_params)

    if gathering.save
      render json: gathering
    else
      render json: gathering.errors, status: :unprocessable_entity
    end
  end

  # Update
  def update
    gathering = Gathering.find(params[:id])

    if gathering.update(gath_params)
      render json: gathering
    else
      render json: gathering.errors, status: :unprocessable_entity
    end
  end

  # Destroy
  def destroy
    gathering = Gathering.find(params[:id])
    gathering.destroy
  end

  # Strong Params
  def gath_params
    params.require(:gathering).permit(:title, :location, :date, :description)
  end

  private :gath_params

end
