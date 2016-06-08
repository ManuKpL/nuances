class QueriesController < ApplicationController

  before_action :find_query, only: [:show, :edit, :update, :destroy]
  before_action :verify_editor_rights

  def show
    @choice = Choice.new
  end

  def index
    @queries = Query.order(:content)
    @themes = Theme.order(:name)
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    if @query.save
      redirect_to query_path(@query)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @query.update(query_params)
      redirect_to query_path(@query)
    else
      render :edit
    end
  end

  def destroy
    if @query.destroy
      redirect_to queries_path
    else
      redirect_to queries_path, alert: 'Suppression impossible'
    end
  end

  private

  def find_query
    @query = Query.find(params[:id])
  end

  def query_params
    params.require(:query).permit(:theme_id, :content, :description, :see_more, :validated)
  end
end
