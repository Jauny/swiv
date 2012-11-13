class ShowsusersController < ApplicationController

  def create
    @showsusers = Showsusers.new(
      :show_id => params[:show_id],
      :user_id => current_user.id)
    @showsusers.save

    if @showsusers.save
      flash[:notice] = "Successfully tracked"
      redirect_to root_path
    else
      flash[:warning] = "shit happened"
      redirect_to root_path
    end
  end

end