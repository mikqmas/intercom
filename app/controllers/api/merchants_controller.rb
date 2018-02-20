class Api::MerchantsController < ApplicationController
  def show
    @merchant = Merchant.where(uuid: merchant_params[:uuid]).first_or_create
    if @merchant
      render json: @merchant
    else
      render json: @merchant.errors.full_message, status: 422
    end
  end

  def destroy
  end

  private
  def merchant_params
    params.permit(:uuid)
  end
end
