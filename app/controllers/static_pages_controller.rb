class StaticPagesController < ApplicationController
  def index
    @search = Show.search(params[:q])
  end
end
