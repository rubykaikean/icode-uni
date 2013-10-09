class StationsController < ApplicationController
  before_action :check_role
  before_filter :authenticate_user!
  #before_filter :search
  before_action :set_station, only: [:show, :edit, :update, :destroy]
  autocomplete :project, :name

  # GET /stations
  # GET /stations.json
  def index
    # @search = Station.search(params[:q])
    # @stations = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)

    # @search = Product.search(params[:search])
    # @products = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)

    @search = Project.search(params[:q])
    @projects = @search.result(distinct: true).paginate(:page => params[:page], :per_page=>5)

    # @stations = Station.all
    # @products = Product.first
    #@detail_inventory_report = InventoryHistory.find(params[:in_ids])
    # @station = Station.new
    # @search = Station.search(params[:q])
    # #render :text => @search.result(:distinct => true).to_json
    # @search_index_station = @search.result(:distinct => true)

    # @products = Product.all
    # a = Station.all
    # @show_product_station = a.all
    
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)
    #Station.generation_new_item(params[:station])
    respond_to do |format|
      if @station.save
        format.html { redirect_to stations_path , notice: 'Station was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @station }
      else
        format.html { render action: 'new' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to stations_path, notice: 'Station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    # render :text => @station.id.to_json
    #result.any? {|c| c == 8 }  # find all record that id = 8
    # @abc = Station.where("id > 5").pluck(:id)
    estimation = Estimation.pluck(:station_id)
    if estimation.any? {|a| a == @station.id }
        redirect_to stations_path , notice: 'Make sure delete all estimation before delete station.'
        # render :text => "true"
       else
        @station.destroy
          respond_to do |format|
            format.html { redirect_to stations_path }
            format.json { head :no_content }
          end
      end
  end

  def standard_project_station
    @search = Station.search(params[:q])
    @stations = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
    #@product = Product.find(params[:id])
    #@stations = Station.where("product_id = ?", params[:id])
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    def search
      index
      render :index
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name, :project_id)
    end

    def check_role
      unless role(Station::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
