class UsersController < ApplicationController

  before_action :set_user, only: :show
  before_action :set_themes, only: [:show, :index]
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

  def set_bgs
    @backgrounds = %w(bg-dark-blue bg-blue bg-light-blue)
  end

  def set_themes
    @themes = Array.new
    Theme.order(:name).each do |theme|
      count = 0
      theme.queries.each do |query|
        count +=1 if query.users.include?(@user)
      end
      percentage = (count * 100.0 / theme.queries.count).round(0).to_s << "%"
      @themes << { name: theme.name, queries: percentage }
    end
  end
end
