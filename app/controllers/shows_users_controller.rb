class ShowsUsersController < ApplicationController

  def create
    @show = Show.find params[:show_id]
    current_user.shows << @show

    respond_to do |format|
      format.js   { render 'replace_track.js' }
      format.html { redirect_to(shows_path) }
    end
  end

  def destroy
    @show = Show.find params[:id]
    current_user.shows.delete @show

    respond_to do |format|
      format.js   { render 'replace_track.js' }
      format.html { redirect_to(shows_path) }
    end
  end

end
