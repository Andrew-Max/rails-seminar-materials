class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @new_user = User.new
    @messages = Message.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  @owner = User.find(params[:id])
  @messages = @owner.messages.all
  @message = Message.new
  end

  # GET /users/new
  # def new
  #   @user = User.new
  # end

  # GET /users/1/edit
  # def edit
  # end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        params[:current_user_id] = @user.id
        set_current_user_id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        # binding.pry
        @users = User.all
        @new_user = @user
        @errors = @user.errors
        @messages = Message.all
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @current_user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @current_user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def log_out
    cookies.signed[:current_user_id] = nil
    redirect_to root_url
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :current_user_id)
  end

end
