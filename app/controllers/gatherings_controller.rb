class GatheringsController < ApplicationController

  # Index
  def index
    gatherings = Gathering.all
    render json: gatherings, each_serializer: GatheringsSerializer, root: 'gatherings'
  end

  # Show
  def show
    gathering = Gathering.find(params[:id])
    render json: gathering, serializer: GatheringsSerializer, root: 'gatherings'
  end

  # Create
  def create
    user = current_user
    gathering = user.gatherings.new(gath_params)

    if gathering.save
      render json: gathering
    else
      render json: gathering.errors, status: :unprocessable_entity
    end
  end

  # Update
  def update
    user = current_user
    gathering = Gathering.find(params[:id])

    if user.id == gathering.user_id

      if gathering.update(gath_params)
        render json: gathering
      else
        render json: gathering.errors, status: :unprocessable_entity
      end

    else
      head :unauthorized
    end
  end

  # Destroy
  def destroy
    gathering = Gathering.find(params[:id])
    user = current_user

    if user.id == gathering.user_id
      gathering.destroy
    else
      head :unauthorized
    end
  end

  # Strong Params
  def gath_params
    params.require(:gathering).permit(:title, :location, :date, :description)
  end

  private :gath_params

end
