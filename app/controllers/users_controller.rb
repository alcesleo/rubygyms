class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Created user'
    else
      render :new
    end
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
