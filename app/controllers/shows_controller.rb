class ShowsController < ApplicationController
  def index
    @shows = Show.all
    if user_signed_in?
      @tracked_show = {}
      Showsusers.where(:user_id => current_user.id).each do |showuser|
        @tracked_show[showuser.show_id] = showuser.id
      end
    end
  end

  def show
    @show = Show.find(params[:id])
  end
end