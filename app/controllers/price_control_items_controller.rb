class PriceControlItemsController < ApplicationController
  before_action :set_price_control_item, only: [:show, :edit, :update, :destroy]
  autocomplete :materials, :material_code
  layout "enter_data", :only => [:new]

  # GET /price_control_items
  # GET /price_control_items.json
  def index
    @price_control_items = PriceControlItem.all
    @price_control = PriceControl.find(params[:price_control_id])
  end

  # GET /price_control_items/1
  # GET /price_control_items/1.json
  def show
  end

  # GET /price_control_items/new
  def new
    @price_control = PriceControl.find(params[:price_control_id])
    @price_control_item = PriceControlItem.new
  end

  # GET /price_control_items/1/edit
  def edit
    @price_control = PriceControl.find(params[:price_control_id])
  end

  # POST /price_control_items
  # POST /price_control_items.json
  def create
    @price_control_item = PriceControlItem.new(price_control_item_params)

    respond_to do |format|
      if @price_control_item.save 
        format.html { redirect_to new_price_control_item_path(:price_control_id => params[:price_control_item][:price_control_id]) , notice: 'Price control item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @price_control_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @price_control_item.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_control_item
      @price_control_item = PriceControlItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_control_item_params
      params.require(:price_control_item).permit(:material_id, :old_unit_price, :old_eff_date, :new_unit_price, :new_eff_date, :price_control_id)
    end
end
