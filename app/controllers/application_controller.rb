class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def verify_editor_rights
    redirect_to root_path, alert: "Vous n'avez pas les droits pour accéder à cette page" unless current_user.editor
  end
end
