class ChoicesController < ApplicationController

  before_action :find_choice, only: [:edit, :update, :destroy]

  def new
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      redirect_to query_path(@choice.query)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @choice.update(choice_params)
      redirect_to query_path(@choice.query)
    else
      render :edit
    end
  end

  def destroy
    query = @choice.query
    if @choice.destroy
      redirect_to query_path(query)
    else
      redirect_to query_path(query), alert: 'Suppression impossible'
    end
  end

  private

  def find_choice
    @choice = Choice.find(params[:id])
  end

  def choice_params
    params.require(:choice).permit(:query_id, :content)
  end
end
