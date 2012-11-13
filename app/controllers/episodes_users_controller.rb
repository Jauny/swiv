class EpisodesUsersController < ApplicationController

  def create
    @user = current_user
    @user.episodes << Episode.find(params[:episode_id])

    redirect_to show_path(params[:show_id])
  end

  def destroy
    @user = current_user
    @user.episodes.delete(Episode.find(params[:id]))

    redirect_to show_path(params[:show_id])
  end

end