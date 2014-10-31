require 'rails_helper'

RSpec.describe Workout, :type => :model do
  it { is_expected.not_to accept_values_for :title, "" }
  it { is_expected.to accept_values_for :title, "My workout" }

  it { is_expected.not_to accept_values_for :club, nil }
  it { is_expected.to accept_values_for :club, Factory(:club) }
end
