class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tracked_shows = User
  end
end