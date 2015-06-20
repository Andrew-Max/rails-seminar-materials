class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

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
