class UsersController < ApplicationController
skip_before_filter :check_session, :only => [:new, :create]

  # users#show notes
  # routing info: HTTP GET to => /users/:id

  # A show action displays info for a single object, in this case a single user.
  # Each link to a user passes an id param to the server when it is clicked
  # (params[:id] evaluates to the value of this parameter).
  # The top line finds the user with an id that matches the id from params and saves it to an instance variable @owner.
  # Remember that all instance variables (ones with an @ in front of them) will be available in the view that gets rendered.
  # We then find all the messages that belong to @owner and save them in an instance variable @messages
  # Finally we make an empty message and save it in an instance variable. This is needed for the new message form displayed on this page.
  # After this, the default template will be rendered (users/show.html.erb)

  def show
    #<<< create an instance variable called owner and set it equal to the user whose id matches params[:id] >>>
    #<<< create an instance variable called messages and set it equal to all of owners messages >>>
    #<<< create an instance variable called new_message and set it equal to a new message >>>
  end

  # users#create notes
  # routing info: HTTP POST to => /users/

  # This action recieves the data from the new user form and creates a user based off of it.
  # There is no view for it, it either redirects to the new users profile if it succeeds or back to the new user form if it fails.
  # it handles two cases. If the user is successfully created it sets the current user and redirects to the show page for that user. If it fails it sends you back to the
  # home page with and returns the same user back to the form along with its validation errors so the user can try to create a new user again.
  def create
    @user = User.new(user_params)
    if @user.save
      params[:current_user_id] = @user.id
      set_current_user_id
      redirect_to @user, notice: 'User was successfully created.'
    else
      @new_user = @user
      @errors = @user.errors
      @messages = Message.all
      render :new
    end
  end

  # users#new notes
  # routing info: HTTP GET to => /users/new

  # this page simply renders a form to create a new user.
  # Once the form is submitted it will be handled by the user#create action
  # The new user is necessary for the form. Note the new instead of create so this isn't saved to the database here.

  #<<<  define a new method called new. Make sure to put an "end" below it>>>
  #<<<  Inside your new method create an instance variable @user and set it equal to a new user >>>
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  # This method is called when creating a new user. It prevents people from using our form to submit malicious content.
  def user_params
    params.require(:user).permit(:name, :email, :current_user_id)
  end

end
