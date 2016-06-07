class AnswersController < ApplicationController

  before_action only: :new do
    reset_queries
    set_query
  end
  before_action :find_query, only: [:show, :edit]

  def show
  end

  def index
  end

  def new
  end

  def create
    @answer = Answer.new(answer_params.merge(user_id: current_user.id))
    if @answer.save
      redirect_to new_answer_path
    else
      redirect_to new_answer_path, alert: 'Une erreur est survenue'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def reset_queries
    case params[:reset]
    when 'all'
      Query.where(validated: true).each do |query|
        query.answers.where(user_id: current_user.id).destroy_all
      end
    end
  end

  def set_query
    queries = Array.new
    answered_queries = Array.new
    validated_queries = Query.where(validated: true)
    validated_queries.each do |query|
      if query.users.include?(current_user)
        answered_queries << query
      else
        queries << query
      end
    end
    @total = validated_queries.count
    @count = @total - answered_queries.count
    if queries == [nil]
      @query = Query.new(content: 'Vous avez répondu à toutes les questions disponibles')
    else
      @query = queries.sample
    end
  end

  def find_query
    @query = Query.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:query_id, :choice_id)
  end
end
