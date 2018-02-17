class Api::GroupsController < ApplicationController
  def index
    debugger
    @employee = Employee.find_by_uuid(params['employee_id'])
    @groups = @employee.groups
    if @employee && !@groups.empty?
      render :index
    else
      render json: @groups, status: 422
    end
  end

  def show
  end

  def create
    debugger
    @employee = Employee.find_by_uuid(params['employee_id'])
    @group = @employee.groups.new(group_params)
    if @employee && @group.save
      @employee.groups << @group
      render json: @group
    else
      render json: @group, status: 422
    end
  end

  private
  def group_params
    params.permit(:name)
  end
end
