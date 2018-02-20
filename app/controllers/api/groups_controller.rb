class Api::GroupsController < ApplicationController
  def index
    @employee = Employee.find_by_uuid(params['employee_id'])
    @groups = @employee.groups
    @groups = @groups.where(name: group_params[:name]) if group_params[:name]
    if @employee && !@groups.empty?
      render :index
    else
      render json: @groups, status: 422
    end
  end

  def show

  end

  def create
    @employee = Employee.find_by_uuid(params['employee_id'])
    body = JSON.parse(params['out'])
    name = body['name']
    @group = @employee.groups.new(name: name)
    @employees = []

    body['employees'].each do |employee|
      @employees << Employee.where(uuid: employee['id'], name: employee['name'], merchant_id: Merchant.find_by_uuid(params['merchant_id']).id).first_or_create
    end
    if @employee && @group.save
      @employee.groups << @group
      @employees.each do |empl|
        @group.employees << empl
      end
      render :show
    else
      render json: @group, status: 422
    end
  end

  private
  def group_params
    params.permit(:name, :employees)
  end
end
