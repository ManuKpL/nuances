class UsersController < ApplicationController

  before_action only: :show do
    set_user
    set_themes_global
  end
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

  def set_themes_global
    @themes = Array.new
    Theme.order(:name).each do |theme|
      count = 0
      global = theme.answers.map(&:choice_id)
      user = theme.answers.where(user_id: @user).map(&:choice_id)
      user.each { |answer| count += global.count(answer) - 1 }
      percentage = (count * 100.0 / (global.count - user.count)).round.to_s << "%"
      @themes << { name: theme.name, queries: percentage }
    end
  end
end
