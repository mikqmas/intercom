class Api::MerchantsController < ApplicationController
  def show
    render json: Merchant.find_by_id(params['id'])
  end

  def destroy
  end

  def create
  end
end
