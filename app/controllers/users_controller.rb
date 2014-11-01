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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash.now.notice = "Updated information"
    render :edit
  end

private

  # TODO: make a separate update_user_params

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :owner,
      :club_id,
      :password,
      :password_confirmation,
    )
  end
end
