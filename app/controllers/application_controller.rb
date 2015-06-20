class ApplicationController < ActionController::Base

  # ************************
  # Description

  # If you look at the class definition of any other controller you will see the line
  # class WhateverController < ApplicationController

  # That means that those controllers inherit from this one.

  # So what does that mean?

  # Basically anything you put in here also gets put into any controller that inherits from it.
  # By defining something in here you are essentially defining it in every controller
  # If you have code that is repeated in multiple controllers, put it here instead to avoid repeating yourself
  # *************************

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
