class Api::MessagesController < ApplicationController
  def index
    @messages = Message.all.order(`#{message_params.orderBy} #{message_params.direction}`).limit(message_params.limit).offset(message_params.offset)
    if @messages
      render json: @messages
    else
      render @messages.errors.full_message, status: 422
    end
  end

  def show
  end

  def destroy
  end

  def create
    @message = Message.create(message_params)
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
    params.permit(:body, :employee_id, :offset, :limit, :orderBy, :direction)
  end
end
