class ShowsUsersController < ApplicationController

  def create
    @user = current_user
    @user.shows << Show.find(params[:show_id])

    redirect_to shows_path
  end

  def destroy
    @user = current_user
    @user.shows.delete(Show.find(params[:id]))

    redirect_to shows_path
  end

end