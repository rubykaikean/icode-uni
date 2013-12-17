class MaterialsController < ApplicationController
  before_action :check_role
  before_action :set_material, only: [:show, :edit, :update, :destroy, :estimation_item]
  autocomplete :material, :name

  # GET /materials
  # GET /materials.json
  def index
    @search = Material.search(params[:q])
    @materials = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
    #@materials = Material.all
    @create_material = Material.new

  end

  # GET /materials/1
  # GET /materials/1.json
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials
  # POST /materials.json
  def create
    
    @material = Material.new(material_params)
    # @material.save!
    # redirect_to materials_path, notice: 'Material was successfully created'
    # render :text => @material.to_json
    respond_to do |format|
      if @material.save
        
        format.html { redirect_to materials_path, notice: 'Material was successfully created.' }
        format.json { render action: 'show', status: :created, location: @material }
      else
        format.html { 
          render action: 'new' 
          flash[:alert] = 'Material cannot save..' 
        }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordNotUnique
    @material.errors[:material_code] << "duplicated"
    flash[:alert] = 'Material cannot save..'
    render action: 'new' 
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to materials_path, notice: 'Material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_materials_path }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url }
      format.json { head :no_content }
    end
  end

  def estimation_item
    @estimation_item = @material.estimation_item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:name,:created_at , :updated_at , :price_fomular_id,:material_code , :wt_ibs_ft,  :thk_dia , :thk_dia_um , :dimension_h , :dimension_w , :plate , :category_id)
    end

    def check_role
      unless role(Material::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
