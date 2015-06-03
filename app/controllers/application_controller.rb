class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_session
  before_action :set_current_user, :check_session

  private

  def set_current_user
    cookies.signed[:current_user_id] = nil unless User.any?
    @current_user = User.find_by_id(cookies.signed[:current_user_id])
  end

  def check_session
    redirect_to new_session_path unless @current_user
  end
end
