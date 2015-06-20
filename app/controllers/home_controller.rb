class HomeController < ApplicationController
  # ************************
  # Description

  # This controller handles requests to a users home page.
  # Because it displays content related to users and messages it would not be a good fit for either of those controllers
  # (A user Controller should be strictly related to user content. It shouldn't be handling users and messages. Same for messages)
  # There fore we break this content into a seperate controller which is appropriate for anything we want to display on the homepage
  # *************************


  layout false, only: :help
  skip_before_filter :check_session, only: :help

# ==============================================================
# home help method
# routing info: HTTP GET to => /help
# ==============================================================
  def help

  end

# COMPLETE THIS CODE
###########################################################################################

# ==============================================================
# home index method
# routing info: HTTP GET to => / (the root url)
# ==============================================================
#<<< in the class create a method index >>>

#<<< in the index method create an instance variable @users and set it equal to all users in the database >>>
#<<< in the index method create an instance variable @messages and set it equal to all messages in the database >>>


# HINTS
# =================
 # To get all of a resource, we use activeRecord to search the database.
 # we will call the "all" method on the class we want to retrieve. Remember classes are nameCased (first letter is capitalized)

 # Instance variables always have an @ in front of them. When you make something an instance variable rails will send it to the template you render.
 # Without the @ you could not access that variable in the template. Because we are getting users and messages so we can display them in a template
 # we want to make them instance variables.
end
