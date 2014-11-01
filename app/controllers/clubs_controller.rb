class ClubsController < ApplicationController

  before_filter :authorize_owner!

  def new
  end

  def index
  end

  def show
  end

private

  def authorize_owner!
    if current_user.nil? || !current_user.owner?
      redirect_to root_url
    end
  end
end
