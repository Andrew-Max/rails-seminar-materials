class SessionsController < ApplicationController
  skip_before_filter :check_session, :except => [:destroy]

  # this code handles how the application knows who the current user is.
  # it does this by setting and destroy a cookie that holds the id of the current user.
  # Other controllers can then find the user whos id matches the current_user_id_cookie to figure out who the active user is.
  # This is simple way to deal with sessions for this sample app but would be a very poor way to do this in a production application.

 def destroy
    cookies.signed[:current_user_id] = nil
    redirect_to new_session_path
  end


  def new
    @users = User.all
  end

  def create
    user_id = params[:id]
    cookies.signed[:current_user_id] = user_id
    redirect_to root_url
  end
end
