class QueriesController < ApplicationController

  before_action :find_query, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @queries = Query.all
    @themes = Theme.all
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    if @query.save
      redirect_to queries_path
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @query.update(query_params)
      redirect_to queries_path
    else
      render :edit
    end
  end

  def destroy
    @query.destroy
    redirect_to queries_path
  end

  private

  def find_query
    @query = Query.find(params[:id])
  end

  def query_params
    params.require(:query).permit(:theme_id, :content, :description, :see_more)
  end

end
