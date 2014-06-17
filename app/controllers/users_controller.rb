class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
    @new_user = User.new
    @messages = Message.all
  end

  # GET /users/1
  def show
    @owner = User.find(params[:id])
    @messages = @owner.messages.all
    @message = Message.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      params[:current_user_id] = @user.id
      set_current_user_id
      redirect_to @user, notice: 'User was successfully created.'
    else
      @users = User.all
      @new_user = @user
      @errors = @user.errors
      @messages = Message.all
      render :index
    end
  end

  def log_out
    cookies.signed[:current_user_id] = nil
    redirect_to root_url
  end

  # PATCH/PUT /users/1
  # def update
  #   if @current_user.update(user_params)
  #     redirect_to @user, notice: 'User was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /users/1
  # def destroy
  #   @current_user.destroy
  #   redirect_to users_url, notice: 'User was successfully destroyed.'
  # end

  # GET /users/new
  # def new
  #   @user = User.new
  # end

  # GET /users/1/edit
  # def edit
  # end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :current_user_id)
  end

end
