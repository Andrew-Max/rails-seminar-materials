class HomeController < ApplicationController
# This will act as the current user's home page
  layout false, only: :help

  def help

  end
#<<< in the class create a single method index >>>

#<<< in the index method create an instance variable @users and set it equal to all users in the database >>>
#<<< in the index method create an instance variable @messages and set it equal to all messages in the database >>>
end
