class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user_id, :check_session

  def set_current_user_id
    if User.any?
      @id = cookies.signed[:current_user_id]
      @current_user = @id ? User.find(@id) : nil
    else
      cookies.signed[:current_user_id] = nil
    end
  end

  def check_session
    redirect_to new_session_path unless @current_user
  end
end
