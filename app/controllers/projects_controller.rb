class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :check_role
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  autocomplete :project, :name

  #autocomplete :client, :name

  # GET /projects
  # GET /projects.json
  def index
    @search = Project.search(params[:q])
    @projects = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>10).order("id DESC")
  end

  def list_non_standard_project
    @list_non_standard_project_search = Project.quotation_type.search(params[:q])
    @list_non_standard_projects = @list_non_standard_project_search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
  end

  def list_project_estimation 
    @list_project_estimation = Project.tender_type.search(params[:q])
    @list_project_estimation = @list_project_estimation.result(:distinct => true).paginate(:page =>params[:page], :per_page=> 5).order("id DESC")
  end

  def list_standard_project
    # standard project 
    # @list_standard_projects_search = Project.standard_type.search(params[:q])
    # @list_standard_projects = @list_standard_projects_search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    #render :text => params.to_json
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
    # render :text => params.to_json
    @project = Project.new(project_params)
    #render :text => project_params.to_json
      respond_to do |format|
        # toDo
        # use ? to request the true/false value
        # format.html { render :text => params.to_json }

        if params[:project][:tenders] == '1'
            @project.save
            format.html { 
              redirect_to project_estimation_projects_path(:id => @project) ,notice: "project was successfully created with Tender" 
              #redirect_to project_estimation_projects_path(@project), notice: "testing"
            }
            # standard path
            # format.html { redirect_to project_station_project_path(@project) , notice: 'project was successfully created Standard.' }
            #format.json { render action: 'show', status: :created, location: @project }
        elsif params[:project][:tenders] == '0'
            # format.html {render :text => params.to_json}
            @project.save
            format.html { redirect_to new_station_path(:id => @project), notice: 'project was successfully created with Customize' }
        
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
        format.html { redirect_to projects_path, notice: 'project was successfully updated.' }
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
    # if @project.non_standard = false
    #   render :text => "123"
    # else
    #   render :text => "456"
    # end
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

  def project_estimation
    @project_estimation = Project.find(params[:id])
  end

  def project_station
    #render :text => params[:id].to_json    #this link can take from (def create) @project 
    @standard_project = Project.find(params[:id])
    @projects = Project.where("non_standard = 1", params[:id])
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :project_code, :client_id, :date , :tenders , :quotation)
    end

    def check_role
      unless role(Project::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
