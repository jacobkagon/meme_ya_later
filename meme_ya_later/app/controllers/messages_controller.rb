class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages 
  end

  def show
    @message = current_user.received_messages.find(params[:id])
    # @sent_message = current_user.sent_messages.find(params[:id])
  end

  def new
    @message = Message.new 
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id  
    @message.save
    redirect_to messages_path
    
  end

  def destroy
    @message = current_user.received_messages.destroy(params[:id])
    redirect_to user_path
  end

  private

  def message_params
    params.require(:message).permit(:body, :receiver_id)
  end

end
