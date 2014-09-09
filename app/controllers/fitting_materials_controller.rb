class FittingMaterialsController < ApplicationController
  before_action :check_role
  before_action :set_fitting_material, only: [:show, :edit, :update, :destroy]
  autocomplete :fitting_material, :name
  
  # GET /fitting_materials
  # GET /fitting_materials.json
  def index
    # @fitting_materials = FittingMaterial.all
    @search = FittingMaterial.search(params[:q])
    @fitting_materials = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>50)

    # @create_materials = FittingMaterial.new
  end

  # GET /fitting_materials/1
  # GET /fitting_materials/1.json
  def show
  end

  # GET /fitting_materials/new
  def new
    @fitting_material = FittingMaterial.new
  end

  # GET /fitting_materials/1/edit
  def edit
    session[:fitting_material_page] = request.referer
  end

  # POST /fitting_materials
  # POST /fitting_materials.json
  def create
    @fitting_material = FittingMaterial.new(fitting_material_params)

    respond_to do |format|
      if @fitting_material.save
        format.html { redirect_to new_fitting_material_path, notice: 'Fitting material was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fitting_material }
      else
        format.html { render action: 'new' }
        format.json { render json: @fitting_material.errors, status: :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotUnique
    @fitting_material.errors[:material_code] << "duplicated"
    flash[:alert] = 'Material cannot save..duplicated code'
    render action: 'new' 
  end

  # PATCH/PUT /fitting_materials/1
  # PATCH/PUT /fitting_materials/1.json
  def update

      if @fitting_material.update(fitting_material_params)
        if session[:fitting_material_page].present?
          redirect_to session[:fitting_material_page], notice: 'Fitting material was successfully updated.'
        else
          redirect_to fitting_material_path, notice: 'Fitting Material was successfully updated.'
        end
      else
        render action: 'edit'
      end
  end

  # DELETE /fitting_materials/1
  # DELETE /fitting_materials/1.json
  def destroy
    @fitting_material.destroy
    respond_to do |format|
      format.html { redirect_to fitting_materials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitting_material
      @fitting_material = FittingMaterial.find(params[:id])
    end

    def search
      index
      render :index
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fitting_material_params
      params.require(:fitting_material).permit(:name, :thk_dia, :brand, :modal, :type_1, :pump_capacity, :head, :material_type, :pump_speed, :fan_speed, :motor_power, :motor_pole, :air_flow, :static_pressure, :other, :remark, :material_code)
    end

    def check_role
      unless role(FittingMaterial::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
