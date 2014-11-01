class ClubsController < ApplicationController

  before_filter :authorize_owner!
  before_filter :authorize_correct_owner!, only: [:show]

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      current_user.club_id = @club.id
      current_user.save!
      redirect_to root_path, notice: 'Created club'
    else
      render :new
    end
  end

  def show
  end

private

  def club_params
    params.require(:club).permit(:name, :address)
  end

  def authorize_owner!
    if current_user.nil? || !current_user.owner?
      redirect_to root_url
    end
  end

  def authorize_correct_owner!
    redirect_to root_url unless current_user.club_id == params[:id].to_i
  end
end
