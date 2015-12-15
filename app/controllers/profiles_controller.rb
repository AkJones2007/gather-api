class ProfilesController < ApplicationController

  # Index
  def index
    profile = Profile.all
    render json: profile
  end

  # Show
  def show
    profile = Profile.find(params[:id])
    render json: profile
  end

  # Create
  def create
    profile = Profile.new(profile_params)
    profile.user_id = current_user.id

    if profile.save
      render json: profile
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  # Update
  def update
    user = current_user
    profile = Profile.find(params[:id])

    if user.id == profile.user_id

      if profile.update(profile_params)
        render json: profile
      else
        render json: profile.errors, status: :unprocessable_entity
      end

    else
      head :unauthorized
    end
  end

  # Destroy
  def destroy
    profile = Profile.find(params[:id])
    user = current_user

    if user.id == profile.user_id
      profile.destroy
    else
      head :unauthorized
    end
  end

  # Strong Params
  def profile_params
    params.require(:profile).permit(:fname, :lname, :zip_code)
  end

  private :profile_params

end
