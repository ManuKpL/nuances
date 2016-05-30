class ThemesController < ApplicationController

  before_action :find_theme, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin_rights

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
      redirect to themes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @theme.update(theme_params)
      redirect_to themes_path
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
end
