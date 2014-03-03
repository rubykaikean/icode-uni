class EstimationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :check_role
  before_action :set_estimation, only: [:edit, :update]
  autocomplete :estimation, :title


  # GET /estimations
  # GET /estimations.json
  def index
    @search = Estimation.search(params[:q])
    @estimations = @search.result.paginate(:page => params[:page], :per_page=>5).order('title DESC')
  end

  # GET /estimations/1
  # GET /estimations/1.json
  def show
    # render :text=> params.to_json
    if params[:station_id].present?
      @estimation = Estimation.where("station_id = ?" , params[:station_id])
    end
  end

  # GET /estimations/new
  def new
    # render :text => params.to_json
    #non-standard station path
    if params[:station_id].present?
      @info_station = Station.find(params[:station_id])
    else
      @info_project = Project.find(params[:project_id])
    end
    #@station = Station.find(params[:estimation])
    @estimation = Estimation.new
  end

  # GET /estimations/1/edit
  def edit
    
  end

  # POST /estimations
  # POST /estimations.json
  def create
    @estimation = Estimation.new(estimation_params)

    #render :text => params.to_json
    
      respond_to do |format|
          if params[:estimation][:project_id].present?
             if @estimation.save
              format.html { redirect_to project_estimation_projects_path(:id => params[:estimation][:project_id]), notice: 'Estimation was successfully created.' }
             else
              format.html { render action: 'new' }
              format.json { render json: @estimation.errors, status: :unprocessable_entity }
             end
          elsif params[:estimation][:station_id].present?
            if @estimation.save
              format.html {redirect_to stations_path }
            else
              format.html { render action: 'new' }
              format.json { render json: @estimation.errors, status: :unprocessable_entity }
             end
          else
            if @estimation.save
              format.html { redirect_to estimations_path, notice: 'Estimation was successfully created.' }
              format.json { render action: 'show', status: :created, location: @estimation }
            else
              format.html { render action: 'new' }
              format.json { render json: @estimation.errors, status: :unprocessable_entity }
            end
          end
      end #end of project_id.present?

    #Estimation.generation_new_item(params[:estimation])
  end

  # PATCH/PUT /estimations/1
  # PATCH/PUT /estimations/1.json
  def update
    
    #render :text => params.to_json
    #@estimation.estimation_items.build(params[:estimation_items])
    #Estimation.generation_new_item(params[:estimation])
    respond_to do |format|
      if @estimation.update(estimation_params)
    #     if params[:estimation][:standard_station_id] && params[:estimation][:station_id].present?
    #       format.html { redirect_to list_standard_station_stations_path(:standard_station_id => params[:estimation][:standard_station_id]), notice: 'Estimation was successfully updated.' }
        if params[:estimation][:station_id].present?
        # if params[:estimation][:station_id].present?
          format.html { redirect_to estimations_path }
        # end
        # standrad path 
        elsif params[:estimation][:project_id].present? && params[:estimation][:standard_project_id].present?
          format.html { redirect_to project_estimation_projects_path(:id => params[:estimation][:project_id]) }
        else 
          format.html{ redirect_to estimations_path }
        end
      else
          format.html { render action: 'edit' }
          format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
      
    end
  end

  # DELETE /estimations/1
  # DELETE /estimations/1.json
  def destroy
    #render :text => params.to_json
    a = Estimation.find(params[:id])
      #To record the delete history
    Estimation.history_delete_file(a.title , a.dimension, params[:current_user_id])
    # #delete estimation item that relate to estimation
    estimation_item = EstimationItem.where("estimation_id = ?" , params[:id])
      # render :text => estimation_item.to_json
      estimation_item.each do |p|
        p.destroy
      end
        # here is delete estimation
    estimation = Estimation.find(params[:id])
    estimation.destroy
      respond_to do |format|
        if params[:project_id].present?
          format.html { redirect_to project_estimation_projects_path(:id => params[:project_id]) }
          format.json { head :no_content }
        else
          format.html { redirect_to estimations_path }
          format.json { head :no_content }
        end
      end
  end

  def station_estimation
    # render :text => params[:station_estimation].to_json
    @station_estimation = Station.find(params[:station_estimation])

    #@show_estimation = a.all
  end

  def non_standard_estimation
    # pe_ids is standard estimation id
    if params[:pe_ids].present?
      params[:pe_ids].each do |estimation|
        new_non_standard_estimation = Estimation.new
        standard_estimation = Estimation.find(estimation)

        new_non_standard_estimation = standard_estimation.dup

        new_non_standard_estimation.station_id = params[:format]
        new_non_standard_estimation.project_id = ""
        new_non_standard_estimation.save!

        new_estimation_id = new_non_standard_estimation.id
        old_estimation_id = EstimationItem.where("estimation_id = ?" , estimation)
        EstimationService.new(new_estimation_id , old_estimation_id).create_non_standard_estimation_item

        
        
      end
      redirect_to stations_path , notice: "non_standard created successfully"
    else
      redirect_to list_project_estimation_projects_path, notice: "No record found"
    end

    # EstimationService.new



  end

  def project_estimation_list
    # render :text=>params.to_json
    @project_estimation_list = Project.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimation
      @estimation = Estimation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimation_params
      params.require(:estimation).permit(:status, :project_id ,:client_id, :title, :dimension, :drawing_no_id, :date, :user_id ,:welding , :oxygen_acetylene , :painting , :sand_blasting , :transport ,:crane ,:shipment,:labour,:installation,:dismantle,:machining,:insulation,:civil_work,:electrik,:piling_work,:forming,:misc,:jkkp , :station_id)
    end

    def check_role
      unless role(Estimation::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
