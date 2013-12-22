class UsersController < ApplicationController
  def show
    @user = User.find params[:id]

    @tracked_shows = @user.shows
    @all_episodes = @user.shows.map(&:episodes).flatten
    @all_seen_episodes = @user.all_seen_ep
    @all_missed_episodes = @all_episodes - @all_seen_episodes
  end
end
