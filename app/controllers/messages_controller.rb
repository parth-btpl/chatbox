# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:recipient).find_by(id: params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    @conversation = Conversation.includes(:recipient).find_by(id: params[:conversation_id])
    @message = Message.find_by(id: params[:id])
    @message.destroy

    respond_to do |format|
      format.json do
        head :no_content
      end
    end
  end

  private

  def message_params
    params.permit(:user_id, :body, :image)
  end
end
