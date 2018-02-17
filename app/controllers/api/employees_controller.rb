class Api::EmployeesController < ApplicationController
  def index
    @employees = Merchant.find_by_uuid(employee_params['merchant_id']).employees
    if @employees
      render json: @employees
    else
      render json: @employees, status: 422
    end
  end

  def show
    @employee = Employee.find_by_uuid(params['id'])
    if @employee
      render json: @employee
    else
      render render: @employee, status: 422
    end
  end

  def destroy
  end

  def create
    @employee = Merchant.find_by_uuid(params['merchant_id']).employees.new(employee_params)
    if @employee.save
      render json: @employee
    else
      render @employee.errors.full_message, status: 422
    end
  end

  def update
    @employee = Employee.find_by_uuid(params['id'])
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee, status: 422
    end
  end

  private
  def employee_params
    params.permit(:name, :role, :isOwner, :merchant_id)
  end

end
