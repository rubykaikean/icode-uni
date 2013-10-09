class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :check_role
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  autocomplete :client, :name

  #autocomplete :client, :name

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    # @search = project.search(params[:q])
    # @projects = @search.result(distinct: true)

    # @search = project.search(params[:q])
    # @projects = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>100)
    
    #@project = project.new  
    # @search = Article.search(params[:search])
    # @articles = @search.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    # toDo
    # remove the duplicated code
    a = Station.where(:project_id => params[:id])
    @show_project = a.all
  end

  # GET /projects/new
  def new
    @project = Project.new
    #@client = Client.all
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      # toDo
      # use ? to request the true/false value
      if @project.standard ==  true
          @project.save
          format.html { redirect_to show_standard_project_projects_path , notice: 'project was successfully created Standard.' }
          format.json { render action: 'show', status: :created, location: @project }
        elsif @project.non_standard == true
          @project.save
          format.html { redirect_to stations_path, notice: 'project Was successfully created with Non Standard' }
         else 
           format.html { render action: 'new'}
           format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy

    station = Station.pluck(:project_id)
    if station.any? {|a| a == @project.id }
        redirect_to projects_path , notice: 'Make sure delete all station before delete project.'
        # render :text => "true"
       else
        @project.destroy
          respond_to do |format|
            format.html { redirect_to projects_url }
            format.json { head :no_content }
        end
    end
  end

  def project_station
    #@project_station = project.find(params[:id])
    @project_station = Station.where(:project_id => 11)
    @show_project_station = @project_station.all
  end 

  def standard_project
    @search = project.search(params[:q])
    @projects = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :project_code, :client_id, :date , :standard , :non_standard )
    end

    def check_role
      unless role(Project::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
