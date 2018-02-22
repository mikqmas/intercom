class StaticController < ApplicationController
  def show
    render template: "static/#{params[:page]}"
  end

  def root
    render :index
  end

end
