class Club < ActiveRecord::Base
  validates_presence_of :name
  has_many :users

  def members
    users.where(owner: false)
  end
end
