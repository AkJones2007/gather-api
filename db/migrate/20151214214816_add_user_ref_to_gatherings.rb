class AddUserRefToGatherings < ActiveRecord::Migration
  def change
    add_reference :gatherings, :user, index: true, foreign_key: true
  end
end
