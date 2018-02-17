class Api::GroupsController < ApplicationController
  def index
    @employee = Employee.find_by_uuid(group_params['employee_id'])
    @groups = @employee.groups
    unless @groups.empty?
      render :index
    else
      render json: @groups, status: 422
    end
  end

  def show
  end

  def create
    @employee = Employee.find_by_uuid(group_params['employee_id'])
    @group = @employee.groups.new(group_params)
    if @employee && @group.save
      render json: @group
    else
      render json: @employee.errors.full_message || @group.errors.full_message, status: 422
    end
  end

  private
  def group_params
    params.permit(:name)
  end
end
