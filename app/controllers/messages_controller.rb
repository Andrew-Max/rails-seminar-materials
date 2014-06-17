class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # messages#create info
  # the only messages controller action, it handles the submission of the new message form. If it succesfully creates the message object
  # based on the parameters from the form it will rerender that users show page with the new comment. Otherwise it will rerender that users
  # show page with the message and errors (error rendering is not currently functional but does not break the page because the  instance variables are lost in the redirect)
  # routing info: HTTP POST to => /messages
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

  # PATCH/PUT /messages/1
  # def update
  #   if @message.update(message_params)
  #     redirect_to @message, notice: 'Message was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # # DELETE /messages/1
  # def destroy
  #   @message.destroy
  #   redirect_to messages_url, notice: 'Message was successfully destroyed.'
  # end

  # GET /messages
  # def index
  #   @messages = Message.all
  # end

  # GET /messages/1
  # def show
  # end

  # GET /messages/new
  # def new
  #   @message = Message.new
  # end

  # GET /messages/1/edit
  # def edit
  # end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body, :author_id, :owner_id)
    end
end
