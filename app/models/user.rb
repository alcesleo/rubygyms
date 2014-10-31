class User < ActiveRecord::Base
  belongs_to :club
  validates_presence_of :email

  def full_name
    [first_name, last_name].join(' ')
  end

  def owner?
    owner
  end

  def member?
    !owner?
  end
end
