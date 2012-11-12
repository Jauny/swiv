class ShowsController < ApplicationController
  def index
  end

  def show
    @show = Show.find(params[:id])
  end
end