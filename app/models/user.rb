class User < ActiveRecord::Base
  belongs_to :club
  validates_presence_of :email

  has_secure_password
  # I think has_secure password already does this, but this was the easiest way
  # to get SimpleForm to understand it.
  validates_presence_of :password
  validates_presence_of :password_confirmation, on: :create

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
