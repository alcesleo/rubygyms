require 'rails_helper'

RSpec.describe User, :type => :model do
  it { is_expected.not_to accept_values_for :email, "" }
  it { is_expected.to accept_values_for :email, "email@email.com" }

  it "has a full name" do
    user = Factory.build(:user, first_name: "John", last_name: "Doe")
    expect(user.full_name).to eq "John Doe"
  end

  it "reports the correct role when owner" do
    user = Factory.build(:owner)
    expect(user).not_to be_member
    expect(user).to be_owner
  end

  it "reports the correct role when member" do
    user = Factory.build(:member)
    expect(user).to be_member
    expect(user).not_to be_owner
  end

  it "can be authenticated" do
    user = Factory.create(:user, password: 'password')
    expect(user.authenticate('wrong')).to eq false
    expect(user.authenticate('password')).to eq true
  end


end
