class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: :generate
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  # GET /projects
  # GET /projects.json
  def index
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @image_path = "/progress/#{@project.name}.jpg?#{'%.6f' % Time.new.to_f}" if @img_path   
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        generate_img
        format.html { redirect_to [current_user, @project], notice: 'Project has been created.' }
        format.json { render :show, status: :created, location: [current_user, @project] }
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
        format.html { redirect_to [current_user, @project], notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: [current_user, @project] }
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
      format.html { 
        if @img_path
          File.delete(@img_path) if File.exist? @img_path
        end
        redirect_to user_projects_url(current_user), notice: 'Project was successfully destroyed.' 
      }
      format.json { head :no_content }
    end
  end
  
  # GET /projects/1/generate
  def generate
    begin
      @project = User.find(params[:user_id]).projects.find(params[:id])   
      public_path = Rails.public_path.to_s
      path = public_path << "/progress/#{@project.name}.jpg"
      @img_path = path if File.exists? path
      diff_date = @project.generate_at - Time.now.to_date
      if @img_path && !@project.is_updated && diff_date == 0
        File.open(@img_path, 'rb') do |f|
          send_data f.read, type: "image/jpeg", disposition: "inline"
        end
      else
        kit = generate_img
        send_data kit.to_jpg, type: "image/jpeg", disposition: "inline"
      end 
    rescue ActiveRecord::RecordNotFound
      public_path = Rails.public_path.to_s
      path = public_path << "/imageNotFound.jpg"
      File.open(path, 'rb') do |f|
        send_data f.read, type: "image/jpeg", disposition: "inline"
      end
    end
    
  end
  
  # POST /projects/1/generate
  def generate_post
    begin
      @project = User.find(params[:user_id]).projects.find(params[:id])   
      public_path = Rails.public_path.to_s
      path = public_path << "/progress/#{@project.name}.jpg"
      @img_path = path if File.exists? path
      diff_date = @project.generate_at - Time.now.to_date
      unless @img_path && !@project.is_updated && diff_date == 0      
        generate_img
      end 
      flash[:notice] = "Generate Successfully!"
      redirect_to user_project_path(current_user, @project)
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Project not found!"
      redirect_to user_project_path(current_user, @project)
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:id])
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
      @project.generate_image("jpg")
    end
end
