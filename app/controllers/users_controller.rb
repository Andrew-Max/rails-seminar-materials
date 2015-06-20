class UsersController < ApplicationController
skip_before_filter :check_session, :only => [:new, :create]

  def show
    @owner = User.find(params[:id])
    @messages = @owner.messages.all
    @new_message = Message.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies.signed[:current_user_id] = @user.id
      redirect_to @user
    else
      @users = User.all
      @new_user = @user
      @errors = @user.errors
      @messages = Message.all
      render :new
    end
  end

  def new
    @user = User.new
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :current_user_id)
  end

end
