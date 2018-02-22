class SupportController < ApplicationController
  def index
    render template: "support/support.html"
  end
  def show
    render template: "support/#{params[:page]}"
  end

  def root
    render :index
  end
end
