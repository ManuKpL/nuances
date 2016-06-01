class ThemesController < ApplicationController

  before_action :find_theme, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin_rights
  before_action :set_reminder, only: :new

  def show
  end

  def index
    @themes = Theme.order(:name)
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to theme_path(@theme)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @theme.update(theme_params)
      redirect_to theme_path(@theme)
    else
      render :edit
    end
  end

  def destroy
    if @theme.destroy
      redirect_to themes_path
    else
      redirect_to themes_path, alert: 'Suppression impossible'
    end
  end

  private

  def find_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:name, :description)
  end

  def set_reminder
    @reminder = Theme.order(:name).map(&:name)
  end
end
