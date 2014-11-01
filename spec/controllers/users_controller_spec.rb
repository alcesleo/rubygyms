require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "creates a user" do

      expect {
        post :create, user: { email: 'test@email.com',
                              password: 'password',
                              password_confirmation: 'password'}

      }.to change(User, :count).by(1)

      expect(response).to redirect_to(root_path)
    end

    it "re-renders the template if the credentials are invalid" do
      post :create, user: { email: 'test@email.com',
                            password: 'password',
                            password_confirmation: 'wrong'}

      expect(response).to render_template(:new)
    end
  end

  describe "POST update" do
    it "updates a user" do
      user = Factory(:user, first_name: 'Sarah')
      put :update, id: user.id, user: { first_name: 'Emma' }

      user.reload
      expect(user.first_name).to eq 'Emma'
      expect(response).to render_template(:edit)
    end
  end

end
