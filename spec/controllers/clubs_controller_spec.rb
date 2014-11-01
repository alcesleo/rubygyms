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
  end

end
