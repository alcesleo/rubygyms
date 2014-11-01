require 'rails_helper'

RSpec.describe Club, :type => :model do
  it { is_expected.not_to accept_values_for :name, "" }
  it { is_expected.to accept_values_for :name, "My club" }

  it "selects its members" do
    club = Factory(:club)
    owner = Factory(:owner, club: club)
    member = Factory(:member, club: club)

    expect(club.members).to eq [member]
  end
end
