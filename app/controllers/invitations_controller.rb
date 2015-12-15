class InvitationsController < ApplicationController

  # Gathering Invites
  def gathering_invites
    gathering = Gathering.find(params[:id])
    invites = gathering.invitations

    render json: invites
  end

  # Current User Invitations
  def current_user_invitations
    user = current_user
    invitations = user.profile.invitations

    render json: invitations
  end

  # Show
  def show
    invitation = Invitation.find(params[:id])
    render json: invitation
  end

  # Create
  def create
    gathering = Gathering.find(params[:id])
    invitation = gathering.invitations.new(invitee_id)

    if invitation.save
      render json: invitation
    else
      render json: invitation.errors, status: :unprocessable_entity
    end
  end

  # Update
  def update
    invitation = Invitation.find(params[:id])

    if invitation.update(invite_status)
      render json: invitation
    else
      render json: invitation.errors, status: :unprocessable_entity
    end
  end

  # Destroy
  def destroy
    invitation = Invitation.find(params[:id])
    invitation.destroy
  end

  # Strong Params
  def invitee_id
    params.require(:invitation).permit(:profile_id)
  end

  def invite_status
    params.require(:invitation).permit(:status)
  end

  private :invitee_id, :invite_status

end
