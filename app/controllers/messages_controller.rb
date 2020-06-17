class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.json do
        head :no_content
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body)
  end
end
