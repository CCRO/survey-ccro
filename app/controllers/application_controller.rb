class ApplicationController < ActionController::Base
  protect_from_forgery
 
private
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_user
    redirect_to login_url, :flash => {:error => t(:no_user_flash)} if current_user.nil?
  end

  def require_no_user
    redirect_to root_url, alert: "Not authorized" if current_user
  end

  def require_admin
    redirect_to login_url, alert: "Not authorized" unless current_user && current_user.admin
  end  
end
