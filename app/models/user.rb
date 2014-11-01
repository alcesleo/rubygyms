class User < ActiveRecord::Base
  belongs_to :club
  has_and_belongs_to_many :workouts
  validates_presence_of :email

  has_secure_password

  def self.authenticate(email, password)
    user = find_by(email: email)

    return false if user.nil?
    user.authenticate(password)
  end

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
