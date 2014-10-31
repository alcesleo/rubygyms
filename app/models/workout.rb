class Workout < ActiveRecord::Base
  belongs_to :club
  validates_presence_of :title, :club
end
