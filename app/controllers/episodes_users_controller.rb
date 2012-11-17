class EpisodesUsersController < ApplicationController

  def create
    @user = current_user
    @episode = Episode.find(params[:episode_id])
    @show = @episode.season.show
    @user.episodes << @episode

    respond_to do |format|
      format.js   { render 'replace_status.js' }
      format.html { redirect_to(show_path(params[:show_id])) }
    end
  end

  def destroy
    @user = current_user
    @episode = Episode.find(params[:id])
    @show = @episode.season.show
    @user.episodes.delete(@episode)

    respond_to do |format|
      format.js   { render 'replace_status.js' }
      format.html { redirect_to(show_path(params[:show_id])) }
    end
  end

end
