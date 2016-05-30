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
    @theme.save ? redirect to themes_path : render :new
  end

  def edit
  end

  def update
    @theme.update(theme_params) ? redirect_to themes_path : render :edit
  end

  def destroy
    @theme.destroy ? redirect_to themes_path : redirect_to themes_path, alert: 'Suppression impossible'
  end

  private

  def find_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:name, :description)
  end
end
