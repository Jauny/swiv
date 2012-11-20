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
    terms = params[:search].split(' ').join("%20")
    xml = HTTParty.get("http://www.thetvdb.com/api/GetSeries.php?seriesname=" + terms)["Data"]["Series"]
    if xml.class == Hash
      @shows = []
      @shows << xml
    else
      @shows = xml
    end

    unless @shows
      redirect_to root_path
      flash[:error] = "No show found!"
    end
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