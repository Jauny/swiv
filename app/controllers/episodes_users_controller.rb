class EpisodesUsersController < ApplicationController

  def create
    @episode = Episode.find(params[:episode_id])
    @show = @episode.season.show
    current_user.episodes << @episode

    respond_to do |format|
      format.js   { render 'replace_status.js' }
      format.html { redirect_to(show_path(params[:show_id])) }
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @show = @episode.season.show
    current_user.episodes.delete(@episode)

    respond_to do |format|
      format.js   { render 'replace_status.js' }
      format.html { redirect_to(show_path(params[:show_id])) }
    end
  end

end
