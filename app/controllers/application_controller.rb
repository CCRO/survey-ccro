class ApplicationController < ActionController::Base
  protect_from_forgery
 
 before_filter :store_location
 
private
  def store_location
    unless params[:controller] == "sessions"
      session[:url_after_login] = request.url unless current_user || request.url == new_sessions_url
      session[:url_return_to] = request.url if !request.xhr? && request.path != "/login"
      logger.info session
    end
  end

  def redirect_back_or_default(default, key = :url_return_to, *options)
    redirect_to(session[key] || default, *options)
    logger.info "Redirecting back to: " + session[key] || default
    session[key] = nil
  end
   
 
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
