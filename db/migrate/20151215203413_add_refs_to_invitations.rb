class AddRefsToInvitations < ActiveRecord::Migration
  def change
    add_reference :invitations, :gathering, index: true, foreign_key: true
    add_reference :invitations, :profile, index: true, foreign_key: true
  end
end
