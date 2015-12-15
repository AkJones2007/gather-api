class Invitation < ActiveRecord::Base

  belongs_to :profile
  belongs_to :gathering

end
