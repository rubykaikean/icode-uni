class EstimationsController < ApplicationController
  before_action :check_role
  before_action :set_estimation, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  autocomplete :estimation, :title


  # GET /estimations
  # GET /estimations.json
  def index
    @search = Estimation.search(params[:q])
    @estimations = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
    # @estimations = Estimation.all

    # a = Estimation.where(:station_id => params[:id])
    # @show_station = a.all
    #@estimation_station = Station.find(params[:id]) 
  end

  # GET /estimations/1
  # GET /estimations/1.json
  def show
  end

  # GET /estimations/new
  def new
    #@info_station = Station.find(params[:station_id])
    @station = Station.find(params[:estimation])
    @estimation = Estimation.new
  end

  # GET /estimations/1/edit
  def edit
    
  end

  # POST /estimations
  # POST /estimations.json
  def create

    @estimation = Estimation.new(estimation_params)
    #Estimation.generation_new_item(params[:estimation])
    respond_to do |format|
      if @estimation.save
        format.html { redirect_to estimations_path, notice: 'Estimation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @estimation }
      else
        format.html { render action: 'new' }
        format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimations/1
  # PATCH/PUT /estimations/1.json
  def update
    #@estimation.estimation_items.build(params[:estimation_items])
    #Estimation.generation_new_item(params[:estimation])
    
    respond_to do |format|
      if @estimation.update(estimation_params)
        format.html { redirect_to estimations_path, notice: 'Estimation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimations/1
  # DELETE /estimations/1.json
  def destroy
    estimation_item = EstimationItem.pluck(:estimation_id)
    if estimation_item.any? {|a| a == @estimation.id }
        redirect_to estimations_path , notice: 'Make sure delete all Estimation Item before delete Estimation.'
      else
      @estimation.destroy
      respond_to do |format|
        format.html { redirect_to estimations_url }
        format.json { head :no_content }
      end
    end
  end

  def station_estimation
    # render :text => params[:station_estimation].to_json
    @station_estimation = Station.find(params[:station_estimation])

    #@show_estimation = a.all
  end

  def standard_project_estimation
    @search = Estimation.search(params[:q])
    @estimations = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimation
      @estimation = Estimation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimation_params
      params.require(:estimation).permit(:client_id, :title, :dimension, :drawing_no, :date, :issued_by ,:welding , :oxygen_acetylene , :painting , :sand_blasting , :transport ,:crane ,:shipment,:labour,:installation,:dismantle,:machining,:insulation,:civil_work,:electrik,:piling_work,:forming,:misc,:jkkp , :station_id)
    end

    def check_role
      unless role(Estimation::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
