class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    respond_with(current_user.projects)
  end
  
  def create
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        format.json { render json: @project.to_json,  success: true, status: :created}
      else
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private 
  def project_params
    params.require(:project).permit(:name, :description, :start_at, :end_at, :expected_progress, :current_progress)
  end
end