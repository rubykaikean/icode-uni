class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_cache_buster
  
  helper_method :roles
  helper_method :user_is_admin?

  def user_is_admin?
    current_user.admin == true
  end

  def user_is_active?
    current_user.status == true
  end

  def roles
    # toDo
    # refactor into a class for user.roles.map ...
    @roles = current_user.roles.map(&:inventory_management_system_id)
    # @roles = UserRole.new(user).roles
  end

  # toDo
  # change the below method name to something descriptive 
  def authorization_admin
    unless user_is_admin?
      redirect_to root_url, flash[:alert] = "You Cannot Access!"
    end
  end

  def authorization_status
    unless user_is_active?
      flash[:alert] = "Account inactive! Contact administrator to activate your account."
      sign_out(current_user)
      redirect_to new_user_session_path
    end
  end

  def search
    index
    render :index
  end

  #testing
  def role(model_array)
      ## to check employee is allow to work on task
      model_array.each do |role|
        unless roles.include?(role)
          break;
          redirect_to root_url, flash[:notice] = "You are not authorize!"
        end
      end
  end
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, 
    	:reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, 
    	:current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip,
    	:failed_attempts, :unlock_token, :locked_at, :authentication_token, :admin) }

    # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, 
    # 	:reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, 
    # 	:current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip,
    # 	:failed_attempts, :unlock_token, :locked_at, :authentication_token, :admin) }
  end

  private

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
