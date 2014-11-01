class Workout < ActiveRecord::Base
  belongs_to :club
  has_and_belongs_to_many :users

  validates_presence_of :title, :club
end
