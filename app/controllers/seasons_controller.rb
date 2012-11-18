class SeasonsController < ApplicationController

  def mark_all_seen
    season = Season.find(params[:id])
    season.episodes.each { |ep| ep.mark_seen(current_user) }

    respond_to do |format|
      format.js   { render 'all_seen.js' }
      format.html { redirect_to show }
    end
  end

end