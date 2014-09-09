class PriceControlItemsController < ApplicationController
  before_action :set_price_control_item, only: [:show, :destroy]
  # before_action :check_materials_id, only: [:create, :update_edit_price]
  layout "enter_data", :only => [:new , :edit , :create]
  # autocomplete :price_control_item, :name
  autocomplete :materials, :material_code
  # GET /price_control_items
  # GET /price_control_items.json
  def index
    @price_control_search = PriceControlItem.search(params[:q])
    @price_control_item = @price_control_search.result(:distinct => true).paginate(:page => params[:page], :per_page=> 30 ).order("id DESC")
  end

  # GET /price_control_items/1
  # GET /price_control_items/1.json
  def show
  end

  # GET /price_control_items/new
  def new
    #@price_control = PriceControl.find(params[:price_control_id])
    @raw_material_price_control_item = PriceControlItem.new
    @fitting_material_price_control_item = PriceControlItem.new
  end

  # GET /price_control_items/1/edit
  def edit
    
  end

  # POST /price_control_items
  # POST /price_control_items.json
  def create
    if params[:commit] == "Create Fitting Material"
      @raw_material_price_control_item = PriceControlItem.new(price_control_item_params)
      respond_to do |format|
        if @raw_material_price_control_item.save 
          format.html { 
          redirect_to new_price_control_item_path , notice: 'Price control item was successfully created.' }
          format.json { render action: 'show', status: :created, location: @raw_material_price_control_item }
        else
          format.html { render action: 'new' }
          format.json { render json: @raw_material_price_control_item.errors, status: :unprocessable_entity }
        end
      end
    else 
      @fitting_material_price_control_item = PriceControlItem.new(price_control_item_params)
      respond_to do |format|
        if @fitting_material_price_control_item.save 
          format.html { 
          redirect_to new_price_control_item_path , notice:'Price control item was successfully created.' }
          format.json { render action: 'show', status: :created, location: @fitting_material_price_control_item }
        else
          format.html { render action: 'new' }
          format.json { render json: @fitting_material_price_control_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /price_control_items/1
  # PATCH/PUT /price_control_items/1.json
  def update
    respond_to do |format|
      if @price_control_item.update(price_control_item_params)
        format.html { redirect_to edit_price_control_items(:price_control_id), notice: 'Price control item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @price_control_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_control_items/1
  # DELETE /price_control_items/1.json
  def destroy
    @price_control_item.destroy
    respond_to do |format|
      format.html { redirect_to price_control_items_url }
      format.json { head :no_content }
    end
  end
  
  def add_raw_group_price
    session[:add_raw_group_price_page] = request.url
    @raw_material_search = Material.search(params[:q])
    @raw_material_list = @raw_material_search.result(:distinct => true).paginate(:page => params[:page], :per_page=>30 )
  end

  def add_fitting_group_price
    session[:add_fitting_group_price_page] = request.url
    @fitting_material_search = FittingMaterial.search(params[:q])
    @fitting_material_list = @fitting_material_search.result(:distinct => true).paginate(:page => params[:page], :per_page=> 30 )
  end

  def edit_price
    @edit_price_search = PriceControlItem.search(params[:q])
    @materials_list = @edit_price_search.result(:distinct => true).paginate(:page => params[:page], :per_page=>30)
  end

  # this is group add item price
  def create_raw_fitting
  # render :text => params.to_json
    if params[:commit] == "Submit Fitting Material"
      if params[:fitting_ids].present?
        if session[:group_price_page].present?
          params[:fitting_ids].each do |fitting_ids|
            new_fitting_price = PriceControlItem.new
            new_fitting_price.fitting_material_id = fitting_ids
            new_fitting_price.new_unit_price = params[:new_price]
            new_fitting_price.new_eff_date = params[:date]
            new_fitting_price.save!
          end
        redirect_to session[:add_fitting_group_price_page], notice: "Successfully created Price and Date!"
        end
      else
        redirect_to add_fitting_group_price_price_control_items_path, notice: "Please Click at least one check box!"
      end
    else
      if params[:raw_ids].present?
        params[:raw_ids].each do |raw_ids|
          new_raw_price  = PriceControlItem.new
          new_raw_price.material_id = raw_ids
          new_raw_price.new_unit_price = params[:new_price]
          new_raw_price.new_eff_date = params[:date]
          new_raw_price.save!
        end
        redirect_to session[:add_raw_group_price_page], notice: "Successfully created Price and Date!"
      else
        redirect_to add_raw_group_price_price_control_items_path, notice: "Please click at least one check box!"
      end
    end
  end


  #this is add single add item price 
  def update_edit_price
    # render :text => params.to_json
    if params[:price_ids].present?
      params[:price_ids].each do |price_id|
        item = PriceControlItem.find(price_id)
        item.new_unit_price = params[:new_price]
        item.new_eff_date = params[:date]
        item.save
      end
      redirect_to edit_price_price_control_items_path, notice: 'Price and Date had been updated'
    else
      redirect_to edit_price_price_control_items_path, notice: 'Please Select At least one item'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_control_item
      @price_control_item = PriceControlItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_control_item_params
      params.require(:price_control_item).permit(:fitting_material_id, :material_id, :old_unit_price, :old_eff_date, :new_unit_price, :new_eff_date, :price_control_id)
    end

    def check_role
      unless role(PriceControlItem::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end

end
