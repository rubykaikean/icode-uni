class HistoryFileDeletesController < ApplicationController
  before_action :check_role
  before_action :set_history_file_delete, only: [:show, :edit, :update, :destroy]

  # GET /history_file_deletes
  # GET /history_file_deletes.json
  def index
    @history_file_deletes = HistoryFileDelete.all.paginate(:page => params[:page], :per_page=>5).order("id DESC")
  end

  # GET /history_file_deletes/1
  # GET /history_file_deletes/1.json
  def show
  end

  # GET /history_file_deletes/new
  def new
    @history_file_delete = HistoryFileDelete.new
  end

  # GET /history_file_deletes/1/edit
  def edit
  end

  # POST /history_file_deletes
  # POST /history_file_deletes.json
  def create
    @history_file_delete = HistoryFileDelete.new(history_file_delete_params)

    respond_to do |format|
      if @history_file_delete.save
        format.html { redirect_to @history_file_delete, notice: 'History file delete was successfully created.' }
        format.json { render action: 'show', status: :created, location: @history_file_delete }
      else
        format.html { render action: 'new' }
        format.json { render json: @history_file_delete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /history_file_deletes/1
  # PATCH/PUT /history_file_deletes/1.json
  def update
    respond_to do |format|
      if @history_file_delete.update(history_file_delete_params)
        format.html { redirect_to @history_file_delete, notice: 'History file delete was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @history_file_delete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_file_deletes/1
  # DELETE /history_file_deletes/1.json
  def destroy
    @history_file_delete.destroy
    respond_to do |format|
      format.html { redirect_to history_file_deletes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_file_delete
      @history_file_delete = HistoryFileDelete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_file_delete_params
      params.require(:history_file_delete).permit(:title , :dimension , :user_id)
    end

    def check_role
      unless role(HistoryFileDelete::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
