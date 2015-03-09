class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_user
    if !logged_in?
      redirect_to root_path
      flash[:danger] = "You need to log in to do that!"
    end
  end

  def can_edit?(recipe)
    recipe.creator == current_user
  end

  def display_error
    flash[:danger] = "You are not allowed to do that!"
    redirect_to root_path
  end
end
