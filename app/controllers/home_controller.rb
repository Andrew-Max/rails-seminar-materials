class HomeController < ApplicationController
  def index
    @users = User.all.limit(20)
    @messages = Message.all.limit(100)
  end
end
