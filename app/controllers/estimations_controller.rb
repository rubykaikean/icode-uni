class EstimationsController < ApplicationController
  before_action :set_estimation, only: [:show, :edit, :update, :destroy]

  # GET /estimations
  # GET /estimations.json
  def index
    @estimations = Estimation.all
  end

  # GET /estimations/1
  # GET /estimations/1.json
  def show
  end

  # GET /estimations/new
  def new
    @estimation = Estimation.new
  end

  # GET /estimations/1/edit
  def edit
  end

  # POST /estimations
  # POST /estimations.json
  def create
    @estimation = Estimation.new(estimation_params)

    respond_to do |format|
      if @estimation.save
        format.html { redirect_to @estimation, notice: 'Estimation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @estimation }
      else
        format.html { render action: 'new' }
        format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimations/1
  # PATCH/PUT /estimations/1.json
  def update
    respond_to do |format|
      if @estimation.update(estimation_params)
        format.html { redirect_to @estimation, notice: 'Estimation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimations/1
  # DELETE /estimations/1.json
  def destroy
    @estimation.destroy
    respond_to do |format|
      format.html { redirect_to estimations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimation
      @estimation = Estimation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimation_params
      params.require(:estimation).permit(:part_detail, :material, :thk_dia, :dimension_h, :dimension_w, :dimension_l, :remarks, :station_id)
    end
end
