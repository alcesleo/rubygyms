require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    it "assigns an empty user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    it "logs a user in" do
      Factory(:user, email: 'test@email.com', password: 'password')

      post :create, user: { email: 'test@email.com', password: 'password' }

      expect(response).to redirect_to(root_path)
    end

    it "re-renders the template if the credentials are wrong" do
      Factory(:user, email: 'test@email.com', password: 'password')

      post :create, user: { email: 'test@email.com', password: 'wrong' }

      expect(response).to render_template(:new)
    end
  end

end
