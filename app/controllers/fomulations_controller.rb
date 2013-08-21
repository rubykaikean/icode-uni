class FomulationsController < ApplicationController
  before_action :set_fomulation, only: [:show, :edit, :update, :destroy]

  # GET /fomulations
  # GET /fomulations.json
  def index
    @fomulations = Fomulation.all
  end

  # GET /fomulations/1
  # GET /fomulations/1.json
  def show
  end

  # GET /fomulations/new
  def new
    @fomulation = Fomulation.new
  end

  # GET /fomulations/1/edit
  def edit
  end

  # POST /fomulations
  # POST /fomulations.json
  def create
    @fomulation = Fomulation.new(fomulation_params)

    respond_to do |format|
      if @fomulation.save
        format.html { redirect_to @fomulation, notice: 'Fomulation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fomulation }
      else
        format.html { render action: 'new' }
        format.json { render json: @fomulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fomulations/1
  # PATCH/PUT /fomulations/1.json
  def update
    respond_to do |format|
      if @fomulation.update(fomulation_params)
        format.html { redirect_to @fomulation, notice: 'Fomulation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fomulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fomulations/1
  # DELETE /fomulations/1.json
  def destroy
    @fomulation.destroy
    respond_to do |format|
      format.html { redirect_to fomulations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fomulation
      @fomulation = Fomulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fomulation_params
      params.require(:fomulation).permit(:thk, :dimension_w, :dimension_l, :wt_ibs_ft)
    end
end
