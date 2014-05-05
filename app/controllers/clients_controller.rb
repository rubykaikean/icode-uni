class ClientsController < ApplicationController
  before_action :check_role
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  autocomplete :client, :name

  # GET /clients
  # GET /clients.json
  def index
    #@clients = Client.all
    @search = Client.search(params[:q])
    @clients = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>30)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path , notice: 'Client was successfully created.' }
        format.json { render action: 'index', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotUnique
    @client.errors[:client_code] << "duplicated"
    flash[:alert] = 'Material cannot save..duplicated code'
    render action: 'new' 
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :client_code , :contact_person_one , :contact_person_two , :contact_person_three , :email , :address)
    end

    def check_role
      unless role(Client::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end
