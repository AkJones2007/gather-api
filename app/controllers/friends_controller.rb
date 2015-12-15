class FriendsController < ApplicationController

  # Get Current User's Friends
  def current_user_friends
    friends = current_user.friends
    render json: friends
  end

  # Create
  def create
    user = current_user
    friend = user.friends.new(friend_id)

    if friend.save
      render json: friend
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  # Update
  def update
    friend = Friend.find(params[:id])

    if friend.update(friendship_status)
      render json: friend
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  # Destroy
  def destroy
    friend = Friend.find(params[:id])

    unless(friend.accepted)
      friend.destroy
    end
  end

  # Strong Params
  def friend_id
    params.require(:friend).permit(:profile_id)
  end

  def friendship_status
    params.require(:friend).permit(:accepted)
  end

  private :friend_id, :friendship_status

end
