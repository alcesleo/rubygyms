class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create!(user_params)
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :owner,
      :password,
      :password_confirmation,
    )
  end
end
