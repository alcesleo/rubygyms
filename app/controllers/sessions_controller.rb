class SessionsController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  # TODO: Refactor
  def log_in
    email, password = params[:user].values_at(:email, :password)
    user = User.authenticate(email, password)

    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Welcome, #{user.email}"
    else
      flash.now.alert = "Invalid email or password"

      @user = User.new
      render :new
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end

private

  def user_params
    params.require(:user).permit(:email, :owner)
  end

end
