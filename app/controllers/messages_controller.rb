class MessagesController < ApplicationController
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
    def message_params
      params.require(:message).permit(:body, :author_id, :owner_id)
    end
end
