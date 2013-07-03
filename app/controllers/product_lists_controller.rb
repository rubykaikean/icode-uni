class ProductListsController < ApplicationController
  before_action :set_product_list, only: [:show, :edit, :update, :destroy]

  # GET /product_lists
  # GET /product_lists.json
  def index
    @product_lists = ProductList.all
  end

  # GET /product_lists/1
  # GET /product_lists/1.json
  def show
  end

  # GET /product_lists/new
  def new
    @product_list = ProductList.new
  end

  # GET /product_lists/1/edit
  def edit
  end

  # POST /product_lists
  # POST /product_lists.json
  def create
    @product_list = ProductList.new(product_list_params)

    respond_to do |format|
      if @product_list.save
        format.html { redirect_to @product_list, notice: 'Product list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_lists/1
  # PATCH/PUT /product_lists/1.json
  def update
    respond_to do |format|
      if @product_list.update(product_list_params)
        format.html { redirect_to @product_list, notice: 'Product list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_lists/1
  # DELETE /product_lists/1.json
  def destroy
    @product_list.destroy
    respond_to do |format|
      format.html { redirect_to product_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_list
      @product_list = ProductList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_list_params
      params.require(:product_list).permit(:estimation_no, :description, :qty, :batch_no, :issue_by, :issue_date, :remark, :client_id)
    end
end
