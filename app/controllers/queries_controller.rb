class QueriesController < ApplicationController

  before_action :find_query, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin_rights

  def show
  end

  def index
    @queries = Query.all
    @themes = Theme.order(:name)
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    @query.save ? redirect_to queries_path ; render :new
  end

  def edit
  end

  def update
    @query.update(query_params) ? redirect_to queries_path : render :edit
  end

  def destroy
    @query.destroy ? redirect_to queries_path : redirect_to queries_path, alert: 'Suppression impossible'
  end

  private

  def find_query
    @query = Query.find(params[:id])
  end

  def query_params
    params.require(:query).permit(:theme_id, :content, :description, :see_more)
  end
end
