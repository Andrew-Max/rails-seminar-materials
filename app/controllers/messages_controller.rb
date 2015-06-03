class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # messages#create info
  # the only messages controller action, it handles the submission of the new message form. If it succesfully creates the message object
  # based on the parameters from the form, it will rerender that user's show page with the new comment. Otherwise it will rerender that users
  # show page with the message and errors (error rendering is not currently functional but does not break the page because the  instance variables are lost in the redirect)
  # routing info: HTTP POST to => /messagesW
  def create
    @owner = User.find(message_params[:owner_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_path(@owner), notice: 'Message was successfully created.'
    else
      @errors = @message.errors
      redirect_to user_path(@owner)
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body, :author_id, :owner_id)
    end
end
