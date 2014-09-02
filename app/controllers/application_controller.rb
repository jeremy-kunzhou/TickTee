class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  around_filter :set_timezone
  def after_sign_in_path_for(resource)
    user_projects_path current_user
  end
  
  private 
  
  def set_timezone
    default_timezone = Time.zone
    client_timezone = cookies[:timezone]
    Time.zone = client_timezone if client_timezone.present?
    yield
  ensure
    Time.zone = default_timezone
  end
  
end
