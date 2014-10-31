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

end
