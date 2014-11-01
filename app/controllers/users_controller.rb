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
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to root_path, notice: "Updated information"
  end

private

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
