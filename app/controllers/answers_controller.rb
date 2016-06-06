class AnswersController < ApplicationController

  before_action :set_query, only: :new
  before_action :find_query, only: [:show, :edit]

  def show
  end

  def index
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
  end

  private

  def set_query
    queries = Query.all.map { |query| query unless query.users.include?(current_user) }
    @query = queries.sample
  end

  def find_query
    @query = Query.find(params[:id])
  end
end
