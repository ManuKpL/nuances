class QueriesController < ApplicationController

  before_action :find_query, only: [:destroy, :edit]

  def index
    @queries = Query.all
    @themes = Theme.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @query.destroy
    redirect_to queries_path
  end

  private

  def find_query
    @query = Query.find(params[:id])
  end

end
