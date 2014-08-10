class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    user_projects_path current_user
  end
  
end
