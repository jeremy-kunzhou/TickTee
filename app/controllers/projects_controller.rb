class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :generate]
  before_action :authenticate_user!, except: :generate
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    if @img_path
      @image_path = "/progress/#{@project.name}.jpg"
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        generate_img
        format.html { redirect_to @project, notice: 'Project has been created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { 
          flash[:alert] = "Project has not been created."
          render :new 
        }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)     
        generate_img   
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # GET /projects/1/generate
  def generate
    diff_date = @project.generate_at - Time.now.to_date
    if @img_path && !@project.is_updated && diff_date == 0
      File.open(@img_path, 'rb') do |f|
        send_data f.read, type: "image/jpeg", disposition: "inline"
      end
    else
      kit = generate_img
      send_data kit.to_jpg, type: "image/jpeg", disposition: "inline"
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
      public_path = Rails.public_path.to_s
      path = public_path << "/progress/#{@project.name}.jpg"
      @img_path = path if File.exists? path
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Resource requested don't exist"
      redirect_to "/"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :start_at, :end_at, :expected_progress, :current_progress)
    end
    
    def generate_img       
      @project.generate_at = Time.now.to_date
      @project.is_updated = false;
      @project.save
      kit = Project.generate_image(@project.id, "jpg")
      kit 
    end
end
