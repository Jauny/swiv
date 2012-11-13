class ShowsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = current_user
    @show = Show.find(params[:id])
  end
end