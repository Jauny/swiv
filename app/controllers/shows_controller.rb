class ShowsController < ApplicationController
  def index
    @shows = Show.all.sort { |a, b| b.users.count <=> a.users.count }
  end

  def show
    Show.from_tvdb params[:id] unless Show.exists? params[:id]
    @show = Show.find params[:id]
  end

  def search
    terms = params[:search].split(' ').join("%20")
    xml = HTTParty.get("http://www.thetvdb.com/api/GetSeries.php?seriesname=" + terms)

    if xml["Data"].nil?
      redirect_to root_path
      flash[:error] = "No show found!"
    else
      result = xml["Data"]["Series"]
    end

    if result.class == Hash
      @shows = [result]
    else
      @shows = result
    end
  end
end
