require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    it "assigns an empty user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

end
