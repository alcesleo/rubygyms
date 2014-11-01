require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    it "assigns an empty user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST log_in" do
    it "logs a user in" do
      user = Factory(:user, email: 'test@email.com', password: 'password')

      post :log_in, user: { email: 'test@email.com', password: 'password' }

      expect(response).to redirect_to(root_path)
      expect(session[:user_id]).to eq user.id
    end

    it "re-renders the template if the credentials are wrong" do
      Factory(:user, email: 'test@email.com', password: 'password')

      post :log_in, user: { email: 'test@email.com', password: 'wrong' }

      expect(response).to render_template :new
    end
  end

  describe "GET log_out" do

    it "logs the user out" do
      login(Factory(:user))

      get :log_out

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to root_url
    end
  end

end
