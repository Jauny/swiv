class ShowsController < ApplicationController
  def index
    @user = current_user
    @search = Show.search(params[:q])
    @shows = @search.result
  end

  def show
    @user = current_user
    @show = Show.find(params[:id])
  end

end