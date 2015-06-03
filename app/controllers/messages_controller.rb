class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # messages#index notes
  # routing info: HTTP GET to => /messages

  # An index displays all of a kind of object so the messages#index displays all messages in the database for all users.

  #<<< define a method called index >>>
  #<<< inside that method create an instance variable @messages and set it equal to all of the messages in the database>>>

  # messages#create notes
  # routing info: HTTP POST to => /messages

  # This action responds to new message form submissions (the form is on the user#show page)
  # If it succesfully creates the message object
  # based on the parameters from the form, it will rerender that user's show page with the new comment.
  # Otherwise it will rerender that user's show page with an error message
  def create
    @owner = User.find(message_params[:owner_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_path(@owner), notice: 'Message was successfully created.'
    else
      redirect_to user_path(@owner), notice: '#{@message.errors[0]}'
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :author_id, :owner_id)
    end
end
