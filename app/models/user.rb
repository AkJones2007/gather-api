class User < ActiveRecord::Base

  include Authentication

  has_many :gatherings
  has_one :profile

end
