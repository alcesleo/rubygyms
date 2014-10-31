require 'rails_helper'

RSpec.describe Club, :type => :model do
  it { is_expected.not_to accept_values_for :title, "" }
  it { is_expected.to accept_values_for :title, "My club" }
end
