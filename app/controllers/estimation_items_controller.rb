class EstimationItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_estimation_item, only: [:show, :edit, :update, :destroy]
  layout "enter_data", :only => [:new , :edit , :update] 
  autocomplete :material, :material_code
  autocomplete :fitting_material, :material_code
  # GET /estimation_items
  # GET /estimation_items.json
  def index
    #@estimation_items = EstimationItem.all
    session[:es_id] = params[:estimation_id]
    @info_estimation_items = Estimation.find(params[:estimation_id])

    @estimtion_item_search = EstimationItem.search(params[:q])
    @estimation_item = @estimtion_item_search.result(:distinct => true).paginate(:page => params[:page], :per_page=>10)
  end

  # GET /estimation_items/1
  # GET /estimation_items/1.json
  def show
    
  end

  # GET /estimation_items/new
  def new
    @search = Material.search(params[:q])
    @show_material = @search.result(distinct: true).paginate(:page => params[:page], :per_page=>10)
    @fitting_search = FittingMaterial.search(params[:q])
    @show_fitting_material = @fitting_search.result(distinct: true).paginate(:page => params[:page], :per_page=>10)
    @info_estimation_items = Estimation.find(params[:estimation_id]) 
    @estimation_item = EstimationItem.new
  end

  # GET /estimation_items/1/edit
  def edit
    @search = Material.search(params[:q])
    @show_material = @search.result(distinct: true).paginate(:page => params[:page], :per_page=>10)
    @fitting_search = FittingMaterial.search(params[:q])
    @show_fitting_material = @fitting_search.result(distinct: true).paginate(:page => params[:page], :per_page=>10)
  end

  # POST /estimation_items
  # POST /estimation_items.json
  def create
    # this is for replace the string material_id to integer material_id
    # render :text => params.to_json
    # @estimation_items = EstimationItem.new(estimation_item_params)
    # EstimationItemService.new(params).create_estimation_item  
    
    # respond_to do |format|
    #   if @estimation_items.save
    #     format.html { 
    #       redirect_to new_estimation_item_path(:estimation_id => params[:estimation_item][:estimation_id])
    #       # notice: 'Estimation item #{:estimation_id}was successfully created.' 
    #     }
    #     format.json { render action: 'show', status: :created, location: @estimation_item }
    #   else
    #     format.html { 
    #       redirect_to estimation_items_path 
    #     }
    #     # format.json { render json: @estimation_item.errors, status: :unprocessable_entity }
    #   end
    # end


    @material_detail = Material.all
    params[:estimation_item][:material_id] = params[:material_id]
    params[:estimation_item][:fitting_material_id] = params[:fitting_material_id]
    @estimation_item = EstimationItem.new(estimation_item_params)
    
    if params[:thk_dia].present?
      @estimation_item.thk_dia = params[:thk_dia]
    end
    if params[:thk_dia_um].present?
      @estimation_item.thk_dia_um = params[:thk_dia_um]
    end

    if params[:dimension_w].present?
      @estimation_item.dimension_w = params[:dimension_w]
    end

    if params[:unit_measure].present?
      @estimation_item.uom = params[:unit_measure]
    end

    respond_to do |format|
      if @estimation_item.save!
        format.html { 
          redirect_to new_estimation_item_path(:estimation_id => params[:estimation_item][:estimation_id]), notice: 'Estimation item #{:estimation_id}was successfully created.' 
        }
        format.json { render action: 'show', status: :created, location: @estimation_item }
      else
        format.html { redirect_to estimation_items_path }
        
        format.json { render json: @estimation_item.errors, status: :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordInvalid
    @estimation_item.errors[:qty] << "is not a number"
    flash[:alert] = 'Is not a integer'
    redirect_to new_estimation_item_path(:estimation_id => params[:estimation_item][:estimation_id])
  end

  # PATCH/PUT /estimation_items/1
  # PATCH/PUT /estimation_items/1.json
  def update
    # render :text => params.to_json
    # if params[:estimation_item][:material_id].blank?

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

    def search
      new
      render :new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimation_item_params
      params.require(:estimation_item).permit(:fitting_material_id, :description, :part_detail, :material_id, :thk_dia , :dimension_h, :dimension_w , :dimension_l, :wt_ibs_ft, :qty, :uom, :unit_price, :estimation_id , :thk_dia_um)
    end
end
