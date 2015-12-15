class AddRefsToFriends < ActiveRecord::Migration
  def change
    add_reference :friends, :user, index: true, foreign_key: true
    add_reference :friends, :profile, index: true, foreign_key: true
  end
end
