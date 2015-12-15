class Friend < ActiveRecord::Base
  after_initialize :set_default

  belongs_to :user
  has_one :profile

  def set_default
    self.accepted = false unless self.accepted
  end
end
