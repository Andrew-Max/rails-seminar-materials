class UsersController < ApplicationController
skip_before_filter :check_session, :only => [:new, :create]

# ==============================================================
# show users method
# routing info: HTTP GET to => /users/:id
# ==============================================================
  def show
    #<<< create an instance variable called owner and set it equal to the user whose id matches params[:id] >>>
    #<<< create an instance variable called messages and set it equal to all of @owner's messages >>>
    #<<< create an instance variable called new_message and set it equal to a new instance of the message class>>>
  end


  # EXPLANATION
  # ==================
  # A show action displays info for a single object, in this case a single user.

  # Assume we have an imaginary user saved to the instance variable @user
  # In our views we can create a link to this user with: "link_to(@user.name), user_path(@user)"

  # When a user clicks this link the application will end up in this method (the def show code above)
  # this link will pass extra information to the server which are called parameters

  # we can get the values of these parameters with the variable "params"
  # for example: "params[:id]"  will equal the value of the @users id

  # Also remember that all instance variables (ones with an @ in front of them) will be available in the view that gets rendered.

  # HINTS
  #=================
  # For the first line call the find method on users and pass it the id from the params hash. refer above to see how the params hash works
  # Any model that inherits from ActiveRecord::Base has some methods that help you find, create, update and destroy them. They are

  #Model.new
  #Model.create
  #Model.update
  #Model.destroy
  #Model.save
  #Model.find(:id)
  #Model.where(attribute: value)


# ==============================================================
# Create user method
# routing info: HTTP POST to => /users/
# ==============================================================
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

  # EXPLANATION
  # ==================
  # Note: this action is completed. You don't have to do anything here.
  # This action recieves the data from the new user form and creates a user based off of it.

  # There is no view for it, it either redirects to the new users profile if it succeeds or back to the new user form if it fails.ew

  # It handles two cases. If the user is successfully created it sets the current user and redirects to the show page for that user. If it fails it sends you back to the
  # home page with and returns the same user back to the form along with its validation errors so the user can try to create a new user again.

# ==============================================================
# New User method
# routing info: HTTP GET to => /users/new
# ==============================================================

  #<<<  define a method with the name new. Make sure to put an "end" below it>>>
  #<<<  Inside your "new" method create an instance variable @new_user and set it equal to a new user >>>

  # this method renders a form to create a new user.
  # Once the form is submitted it will be handled by the user#create action.
  # Inside that action, all the things entered into the form will be available in the params hash

  # The new user is necessary for the form. Note the new instead of create so this isn't saved to the database here.
  # refer to the methods listed in the show method's notes for how to make an ew user
# ==============================================================
# ==============================================================

  private
  # This method is called when creating a new user. It prevents people from using our form to submit malicious content.
  def user_params
    params.require(:user).permit(:name, :email, :current_user_id)
  end

end
