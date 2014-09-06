class Api::V1::BaseController < ActionController::Base
  respond_to :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :null_session, if: Proc.new{|c| c.request.format.json?}

  # new function that comes before Devise's one
  before_filter :authenticate_user_from_token!
  # Devise's authentication
  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    user_projects_path current_user
  end

  private
  def authenticate_user_from_token!
    user_email = request.headers["HTTP_X_API_EMAIL"].presence
    user_auth_token = request.headers["HTTP_X_API_TOKEN"].presence
    user = user_email && User.find_by_email(user_email)
    if user && Devise.secure_compare(user.authentication_token, user_auth_token)
      sign_in user, store: false
    end
  end
end