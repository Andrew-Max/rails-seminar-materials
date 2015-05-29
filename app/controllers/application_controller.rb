class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user_id, :check_session


  def set_current_user_id
    if User.any?
      @id = ((params[:current_user_id]) || cookies.signed[:current_user_id]).tap do |id|
        cookies.signed[:current_user_id] = id
      end
    else
      cookies.signed[:current_user_id] = nil
    end
    @current_user = @id.present? ? User.find(@id) : nil

  end

  def check_session
    redirect_to new_session_path unless @current_user
  end
end
