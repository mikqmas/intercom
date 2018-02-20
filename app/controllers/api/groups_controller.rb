class Api::GroupsController < ApplicationController
  def index
    @groups = Merchant.find_by_uuid(params[:merchant_id]).groups
    if !@groups.empty?
      render json: @groups
    else
      render json: @groups, status: 422
    end
  end

  def create
    debugger
    @group = Merchant.find_by_uuid(params[:merchant_id]).groups.new(group_params)

    if @group.save
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
