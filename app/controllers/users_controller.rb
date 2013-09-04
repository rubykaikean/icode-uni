class UsersController < ApplicationController
  before_filter :authorization_admin
  before_action :set_user, only: [:show, :edit_user, :update_user, :destroy, :entry_user]
  autocomplete :user, :username
  ## before_action :checkboxes##, only: [:show]
  # GET /users
  # GET /users.json
  

  # def index
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: UsersDatatable.new(view_context) }
  #   end
  # end

  def index
    @search = User.search(params[:q])
    @users = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
  end

  # def search
  #   index
  #   render :index
  # end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new_user
    @user = User.new
  end

  # GET /users/1/edit
  def edit_user
  end

  def entry_user
  end

  # POST /users
  # POST /users.json
  def create_user

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new_user' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit_user' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin, :status)
    end

    def checkboxes
      # toDo
      # refactor into a class for user.roles.map ...
      @checkboxes = @user.roles.map(&:inventory_management_system_id)
    end
end
