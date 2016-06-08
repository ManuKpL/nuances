class UsersController < ApplicationController

  def show
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: "Les modifications bien été enregistrées"
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :email, :twitter, :facebook)
  end
end
