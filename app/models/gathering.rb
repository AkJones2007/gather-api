class Gathering < ActiveRecord::Base

  belongs_to :user
  has_many :invitations

end
