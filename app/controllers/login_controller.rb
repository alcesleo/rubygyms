class LoginController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Welcome, #{@user.email}"
    else
      flash.now.alert = "Invalid email or password"
      @user = User.new
      render "new"
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :owner)
  end

end
