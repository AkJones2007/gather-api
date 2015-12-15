class User < ActiveRecord::Base

  include Authentication

  has_many :gatherings
  has_many :friends
  has_one :profile

end
