class Api::MessagesController < ApplicationController
  def index
    if(params[:group_id])
      group = Group.find_by_id(params[:group_id])
      @messages = group.messages.reverse
    else
      # @messages = Message.where(from_id: params[:from_id],to_id: params[:to_id])
      @messages = Message.where('(from_id=? AND to_id=?) OR (to_id=? AND from_id=?)', params[:from_id], params[:to_id], params[:from_id], params[:to_id])
      # @messages = Message.where(from_id: params[:from_id],to_id: params[:to_id])
    end
    if @messages
      render json: @messages
    else
      render @messages.errors.full_message, status: 422
    end
  end

  def create
    @message = Merchant.find_by_uuid(params[:merchant_id]).messages.new(message_params)
    @message[:group_id] = params[:group_id]
    if @message.save
      render json: @message
    else
      render @message.errors.full_message, status: 422
    end
  end

  def update
  end

  private
  def message_params
    params.require(:message).permit(:body, :group_id, :to_id, :from_id, :merchant_id)
  end
end
