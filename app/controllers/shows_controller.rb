class ShowsController < ApplicationController
  around_filter :get_new_show, :only => :show

  def index
    @user = current_user
    @shows = Show.all.sort { |a,b| b.users.count <=> a.users.count }
  end

  def show
    @show = Show.find(params[:id])
    @user = current_user
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
      @shows = []
      @shows << result
    else
      @shows = result
    end
  end

  private
  def get_new_show
    begin
      yield
    rescue ActiveRecord::RecordNotFound
      Show.from_tvdb(params[:id])
      retry
    end
  end

end