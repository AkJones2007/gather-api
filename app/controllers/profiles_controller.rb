class ProfilesController < ApplicationController

  # Index
  def index
    profiles = Profile.all
    render json: profiles
  end

  # Show
  def show
    profile = Profile.find_by user_id: params[:id]
    render json: profile
  end

  # Search
  def search
    query = params[:query]
    profiles = Profile.all.select do |profile|
      profile.fname == query ||
      profile.lname == query ||
      profile.zip_code == query
    end
    render json: profiles
  end

  # Show Current User's Profile
  def show_current
    user = current_user
    profile = Profile.find_by user_id: user.id

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
    profile = Profile.find_by user_id: user.id

    if profile.update(profile_params)
      render json: profile
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  # Destroy
  def destroy
    user = current_user
    profile = Profile.find_by user_id: user.id

    profile.destroy
  end

  # Strong Params
  def profile_params
    params.require(:profile).permit(:fname, :lname, :zip_code)
  end

  private :profile_params

end
