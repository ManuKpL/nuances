class UsersController < ApplicationController

  include UsersHelper

  before_action :set_user, only: :show
  before_action :set_users, only: :index
  before_action only: [:show, :index] do
    set_themes
    set_backgrounds
  end

  def show
  end

  def index
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: "Les modifications bien été enregistrées"
    else
      render :show
    end
  end


  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :email, :twitter, :facebook, :photo, :photo_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_users
    @user = current_user
    @users = User.where.not(id: @user).order(:nickname)
  end

  def set_backgrounds
    backgrounds = %w(bg-light-blue bg-blue bg-dark-blue)
    @backgrounds = Array.new
    x = backgrounds.count - 1
    @themes.count.times do
      @backgrounds << backgrounds[x]
      x -= 1
    end
  end

  def set_themes
    @themes = Theme.order(:name)
  end

end
