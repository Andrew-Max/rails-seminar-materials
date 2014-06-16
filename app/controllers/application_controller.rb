class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user

  def set_current_user
    @id = ((params[:current_user_id]) || cookies.signed[:current_user_id] || User.first.try(:id)).tap do |id|
      cookies.signed[:current_user_id] = id
    end
    if params[:action] == 'log_out'
      @current_user = nil
    else
      @current_user = @id.present? ? User.find(@id) : nil
    end
  end
end
