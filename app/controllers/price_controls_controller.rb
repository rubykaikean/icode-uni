class PriceControlsController < ApplicationController
  before_filter :authenticate_user!
  before_action :check_role
  before_action :set_price_control, only: [:show, :edit, :update, :destroy]
  autocomplete :price_control, :reference

  # GET /price_controls
  # GET /price_controls.json
  def index
    # @price_controls = PriceControl.all
    @search = PriceControl.search(params[:q])
    @price_controls = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
  end

  # GET /price_controls/1
  # GET /price_controls/1.json
  def show
  end

  # GET /price_controls/new
  def new
    @price_control = PriceControl.new
  end

  # GET /price_controls/1/edit
  def edit
  end

  # POST /price_controls
  # POST /price_controls.json
  def create
    @price_control = PriceControl.new(price_control_params)

    respond_to do |format|
      if @price_control.save
        format.html { redirect_to price_controls_path, notice: 'Price control was successfully created.' }
        format.json { render action: 'index', status: :created, location: @price_control }
      else
        format.html { render action: 'new' }
        format.json { render json: @price_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_controls/1
  # PATCH/PUT /price_controls/1.json
  def update
    respond_to do |format|
      if @price_control.update(price_control_params)
        format.html { redirect_to price_controls_path, notice: 'Price control was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @price_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_controls/1
  # DELETE /price_controls/1.json
  def destroy
    price_control = PriceControlItem.pluck(:price_control_id)
    if price_control.any? {|a| a == @price_control.id }
        redirect_to price_controls_path , notice: 'Make sure delete all price control item before delete price control.'
        # render :text => "true"
       else
    @price_control.destroy
    respond_to do |format|
      format.html { redirect_to price_controls_url }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_control
      @price_control = PriceControl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_control_params
      params.require(:price_control).permit(:pp_no, :pp_date, :client_id, :reference, :user_id)
    end

    def check_role
      unless role(PriceControl::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
