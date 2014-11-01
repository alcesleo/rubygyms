require 'rails_helper'

RSpec.describe Club, :type => :model do
  it { is_expected.not_to accept_values_for :name, "" }
  it { is_expected.to accept_values_for :name, "My club" }
end
