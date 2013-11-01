class EstimationItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_estimation_item, only: [:show, :edit, :update, :destroy]
  layout "enter_data", :only => [:new , :edit , :update] 

  # GET /estimation_items
  # GET /estimation_items.json
  def index
    #@estimation_items = EstimationItem.all
    session[:es_id] = params[:estimation_id]
    @info_estimation_items = Estimation.find(params[:estimation_id])
    @search = EstimationItem.search(params[:q])
    @estimation_item = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
    
  end

  # GET /estimation_items/1
  # GET /estimation_items/1.json
  def show
    
  end

  # GET /estimation_items/new
  def new
    @estimation = Estimation.find(params[:estimation_id]) 
    @estimation_item = EstimationItem.new
    @show_material = Material.all
    # @show_estimation_id = Estimation.find(params[:estimation])
    # render :text => params[:estimation_id].to_json
    # session[:es] = session[:es].present? ? session[:es] : params[:estimation_id]
  end

  # GET /estimation_items/1/edit
  def edit
    @show_material = Material.all
  end

  # POST /estimation_items
  # POST /estimation_items.json
  def create
    # this is for replace the string material_id to integer material_id
    @material_detail = Material.all
    params[:estimation_item][:material_id] = params[:material_id]
    @estimation_item = EstimationItem.new(estimation_item_params)
    #@estimation_item.thk_dia = params[:thk_dia]
    #@estimation_item.dimension_w = params[:dimension_w]
    @estimation_item.dimension_h = params[:dimension_h]
    @estimation_item.wt_ibs_ft = params[:wt_ibs_ft]
    @estimation_item.unit_price = params[:unit_price]

    # render :text => estimation_item_params.to_json
    # # render :text => params[:estimation_item].to_json
    respond_to do |format|
      if @estimation_item.save
        # if params[:commit] == "submit_and_new"
        format.html { 
          redirect_to new_estimation_item_path(:estimation_id => params[:estimation_item][:estimation_id]), notice: 'Estimation item #{:estimation_id}was successfully created.' 
        }
        format.json { render action: 'show', status: :created, location: @estimation_item }
      else
        format.html { redirect_to estimation_items_path }
        
        format.json { render json: @estimation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimation_items/1
  # PATCH/PUT /estimation_items/1.json
  def update
    # render json: @estimation_item
    # render json: estimation_item_params
    # @show_material = Material.all
    # # params[:estimation_item][:material_id] = params[:material_id]

    # estimation_item[material_id]

    # @estimation_item.dimension_h = params[:dimension_h]
    # @estimation_item.wt_ibs_ft = params[:wt_ibs_ft]
    respond_to do |format|
      if @estimation_item.update(estimation_item_params)
        format.html { redirect_to estimation_items_path(:estimation_id => params[:estimation_item][:estimation_id]), notice: 'Estimation item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estimation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimation_items/1
  # DELETE /estimation_items/1.json
  def destroy
    @estimation_item.destroy
    respond_to do |format|
      format.html { redirect_to estimation_items_path(:estimation_id => session[:es_id])
      session[:es_id] = nil }
      format.json { head :no_content }
    end
  end


 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimation_item
      @estimation_item = EstimationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimation_item_params
      params.require(:estimation_item).permit(:part_detail, :material_id, :thk_dia , :dimension_h, :dimension_w , :dimension_l, :wt_ibs_ft, :qty, :uom, :unit_price, :estimation_id)
    end
end
