class Api::MerchantsController < ApplicationController
  def show
    @merchant = Merchant.find_by_uuid(params['id'])
    if @merchant
      render json: @merchant
    else
      render json: @merchant , status: 422
    end
  end

  def destroy
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      render json: @merchant
    else
      render json: @merchant.errors.full_message, status: 422
    end
  end

  private
  def merchant_params
    params.permit(:uuid, :name, :owner)
  end
end
