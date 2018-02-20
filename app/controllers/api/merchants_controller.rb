class Api::MerchantsController < ApplicationController
  def show
    @merchant = Merchant.where(uuid: params[:id]).first_or_create
    if @merchant
      render json: @merchant
    else
      render json: @merchant.errors.full_message, status: 422
    end
  end

  def destroy
  end
end
