class ShowsController < ApplicationController
  def index
    @tracked_show = {}
    Showsusers.where(:user_id => current_user.id).each do |showuser|
      @tracked_show[showuser.show_id] = true
    end
  end

  def show
    @show = Show.find(params[:id])
  end
end