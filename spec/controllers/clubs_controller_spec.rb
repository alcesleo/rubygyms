require 'rails_helper'

RSpec.describe ClubsController, :type => :controller do

  describe "authorization" do
    it "redirects to root if not logged in" do
      get :new
      expect(response).to redirect_to(root_url)
    end

    it "redirects to root if not an owner" do
      user = Factory(:member)
      login(user)

      get :new

      expect(response).to redirect_to(root_url)
    end

    it "redirects to root if not the owner of that club" do
      owner = Factory(:owner)
      club  = Factory(:club)

      login(owner)

      get :show, id: club.id

      expect(response).to redirect_to(root_url)
    end

    it "shows the page if you're the owner of that club" do
      club  = Factory(:club)
      owner = Factory(:owner, club: club)

      login(owner)

      get :show, id: club.id

      expect(response).to render_template(:show)
    end
  end

  describe "POST create" do

    it "creates a club and sets the club_id of the owner" do

      owner = Factory(:owner, club: nil)
      login(owner)

      expect {
        post :create, club: { name: 'My club' }
      }.to change(Club, :count).by(1)

      # TODO: This doesn't feel very robust
      owner.reload
      expect(owner.club).to eq Club.last
    end

  end

  describe "GET kick" do
    it "kicks a member" do
      club  = Factory(:club)
      owner = Factory(:owner, club: club)
      member = Factory(:member, club: club)

      login(owner)

      get :kick, { id: club.id, member_id: member.id }

      member.reload
      expect(member.club).to be_nil
      expect(response).to redirect_to(club_path(club.id))
    end
  end

end
