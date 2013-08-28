class RolesController < ApplicationController
  ## before_action :set_user_roles, :except => [:create]
  before_action :set_role, only: [:show, :update, :destroy]

   # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # # GET /roles/new
  # def new
  #   @role = Role.new
  # end

  # # GET /roles/1/edit
  # def edit
  # end

  # # POST /roles
  # # POST /roles.json
  # def create
  #   @role = Role.new(role_params)

  #   respond_to do |format|
  #     if @role.save
  #       format.html { redirect_to @role, notice: 'Role was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @role }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @role.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /roles/1
  # # PATCH/PUT /roles/1.json
  # def update
  #   respond_to do |format|
  #     if @role.update(role_params)
  #       format.html { redirect_to @role, notice: 'Role was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @role.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end

  def new
    # @role = @user.roles.new
    @role = Role.new
    @user = User.find(params[:user_id])
  end

  def edit

    @user = User.find(params[:id])
    @roles = Role.where("user_id = ?", params[:id])
    checkboxes
        
  end

  def create
    # render :text => params[:user_id].to_json
    # render :text => params[:inventory_management_system].to_json
    @user = User.find(params[:user_id])    
    

    respond_to do |format|
      if UserRegister.generate_role(@user, params[:inventory_management_system])
        format.html { redirect_to users_path, notice: 'Role was successfully created.' }
        format.json { render action: 'show', status: :created, location: @role }
      else
        format.html { render action: 'new_role' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if UserRegister.generate_role(@user, params[:inventory_management_system])
        format.html { redirect_to users_path, notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit_role' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  ###############################################################################################

  private
    
    def set_user_roles
      # @user = User.find(params[:user_id])
      @user = User.find(params[:id])
    end

    def checkboxes
      # toDo
      # refactor into a class for user.roles.map ...
      @checkboxes = @user.roles.map(&:inventory_management_system_id)
    end

    ##############################################################################################
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
      ## @role = @user.roles # can edit, can show
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:user_id, :inventory_management_system_id)
    end

end
