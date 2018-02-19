class Api::MessagesController < ApplicationController
  def index
    @group = Group.find_by_id(params['group_id']);
    @messages = @group.messages.order(`#{message_params['orderBy']} #{message_params['direction']}`).limit(message_params['limit']).offset(message_params['offset'])
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
    @employee = Employee.find_by_uuid(params['employee_id'])
    @message = @employee.messages.new(message_params)
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
    params.permit(:body, :offset, :limit, :orderBy, :direction, :group_id)
  end
end
