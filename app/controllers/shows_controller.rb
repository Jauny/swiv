class ShowsController < ApplicationController
  around_filter :get_new_show, :only => :show

  def index
    @user = current_user
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
    @user = current_user
  end

  def search
    xml = HTTParty.get("http://www.thetvdb.com/api/GetSeries.php?seriesname=" + params[:search])
    @shows = xml["Data"]["Series"]
  end

  private
  def get_new_show
    begin
      yield
    rescue ActiveRecord::RecordNotFound
      Show.import(params[:id])
      retry
    end
  end

end