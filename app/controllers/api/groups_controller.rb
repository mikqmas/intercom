class Api::GroupsController < ApplicationController
  def index
    @employee = Employee.where(uuid: params[:employee_id]).first_or_create
    @groups = @employee.groups
    if !@groups.empty?
      render json: @groups
    else
      render json: @groups, status: 422
    end
  end

  def create
    @group = Merchant.find_by_uuid(params[:merchant_id]).groups.create(group_params)
    if @group
      JSON.parse(params[:employee_ids]).each do |employ_id|
        employee = Employee.where(uuid: employ_id).first_or_create
        @group.employee_groups.create(employee_id: employee.id)
      end
      render json: @group
    else
      render json: @group, status: 422
    end
  end

  private
  def group_params
    params.permit(:name, :description)
  end
end
