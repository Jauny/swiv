class ShowsUsersController < ApplicationController

  def create
    @user = current_user
    @show = Show.find(params[:show_id])
    @user.shows << @show

    respond_to do |format|
      format.js   { render }
      format.html { redirect_to(shows_path) }
    end
  end

  def destroy
    @user = current_user
    @show = Show.find(params[:id])
    @user.shows.delete(@show)

    respond_to do |format|
      format.js   { render 'replace_track.js' }
      format.html { redirect_to(shows_path) }
    end
  end

end
