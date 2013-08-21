class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  #autocomplete :client, :name

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @product = Product.new

  
    # @search = Article.search(params[:search])
    # @articles = @search.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    a = Station.where(:product_id => params[:id])
    @show_product = a.all
  end

  # GET /products/new
  def new
    @product = Product.new
    @client = Client.all
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.standard ==  true
          @product.save
          format.html { redirect_to standard_project_products_path , notice: 'Product was successfully created Standard.' }
          format.json { render action: 'show', status: :created, location: @product }
        elsif @product.non_standard == true
          @product.save
          format.html { redirect_to stations_path, notice: 'Product Was successfully created with Non Standard' }
         else 
           format.html { render action: 'new'}
           format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def product_station
    #@product_station = Product.find(params[:id])
    @product_station = Station.where(:product_id => 11)
    @show_product_station = @product_station.all
  end 

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :product_code, :client_id, :date , :standard , :non_standard )
    end
end
