class MessagesController < ApplicationController
  before_action :set_recipient, only: [:new, :create]
  def index
    @messages = current_user.received_messages 
  end

  def show
    @message = current_user.received_messages.find(params[:id])
  end

  def new
    @message = Message.new 
  end

  def create
    @message = current_user.sent_messages.new(message_params)
    @message.receiver_id = @receiver.id 
    @message.save
  end

  def destroy
    @message = current_user.received_messages.destroy(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:body, :receiver_id, :sender_id)
  end
  
  def set_receiver
    @receiver = User.find(params[:username])
  end
end
