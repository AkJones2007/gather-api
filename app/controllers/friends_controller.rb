class FriendsController < ApplicationController

  # Get Current User's Friends
  def current_user_friends
    friends = current_user.friends.where accepted: true
    profiles = friends.map{ |friend| Profile.find(friend.profile_id)}
    render json: profiles
  end

  # Get Current User's Pending Requests
  def friend_requests
    friends = current_user.friends.where accepted: false
    profiles = friends.map{ |friend| Profile.find(friend.profile_id)}
    render json: profiles
  end

  # Create
  def create
    friend = Friend.new(friend_id)
    friend.profile_id = current_user.id

    if friend.save
      render json: friend
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  # Update
  def update
    friend = Friend.find_by(user_id: current_user.id, profile_id: params[:id])
    user = Friend.new({
                        user_id: friend.profile_id,
                        profile_id: current_user.id,
                        accepted: true
                      })

    if friend.update(friendship_status) && user.save
      render json: friend
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  # Destroy
  def destroy
    friend = Friend.find_by(user_id: current_user.id, profile_id: params[:id])
    friend.destroy
  end

  # Strong Params
  def friend_id
    params.require(:friend).permit(:user_id)
  end

  def friendship_status
    params.require(:friend).permit(:accepted)
  end

  private :friend_id, :friendship_status

end
