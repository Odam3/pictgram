class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  helper_method :logged_in?, :current_user
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:warning] = "ログインが必要です"
      redirect_to("/users/new")
    end  
  end

  def logged_in?
    !current_user.nil?
  end
end
