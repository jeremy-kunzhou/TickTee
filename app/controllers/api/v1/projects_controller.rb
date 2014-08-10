class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    respond_with(current_user.projects)
  end
end