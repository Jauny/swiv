class SeasonsController < ApplicationController

  def mark_all_seen
    @season = Season.find params[:id]
    @season.mark_all_seen current_user

    respond_to do |format|
      format.js   { render 'mark_all.js' }
      format.html { redirect_to show }
    end
  end

end
