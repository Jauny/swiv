module Notifications

  def today_shows
    today = Time.now("%A")
    today_shows = Show.where(day: today)
  end

end