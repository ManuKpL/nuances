class UsersController < ApplicationController

  include UsersHelper

  before_action only: :show do
    set_user
    set_themes_global
  end
  before_action :set_users, only: :index
  before_action :set_bgs, only: [:show, :index]

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
    @users = User.order(:nickname)
  end

  def set_bgs
    @backgrounds = %w(bg-dark-blue bg-blue bg-light-blue)
  end

  def set_themes_global
    @themes = Array.new
    Theme.order(:name).each do |theme|
      @themes << { name: theme.name, queries: compare_answers(theme) }
    end
  end

end
