require 'httparty'

module TVDB
  API_KEY  = 'BA027FC13CC4F4A9'
  BASE_URL = 'http://www.thetvdb.com/api/'

  # Need an array of <series_id> to send our xml requests

  def self.build_all!(*series_ids)
    series_ids.each do |series_id|
      xml = xml_response(series_id)

      show      = parse_show(xml, series_id)
      seasons   = parse_season(xml, show)
      episodes  = seasons.map { |season| parse_episodes(xml, season) }
    end
  end

  def self.parse_show(xml, series_id)
    name = xml['Data']['Series']['SeriesName']
    plot = xml['Data']['Series']['Overview']

    Show.create(name: name, plot: plot)
  end

  def self.parse_season(xml, show)
    seasons = xml['Data']['Episode'].map { |episode| episode['Combined_season'] }.uniq

    seasons.map do |season_num|
      Season.create(number:season_num.to_i, show_id:show.id)
    end
  end

  def self.parse_episodes(xml, season)
    episodes = xml['Data']['Episode'].select do |episode|
                 episode['Combined_season'] == season.number.to_s
               end

    episodes.map   do |episode|
      Episode.create( number:episode["Combined_episodenumber"],
                      name:episode["EpisodeName"],
                      plot:episode["Overview"],
                      season_id:season.id,
                      air_date:episode["FirstAired"] )
    end
  end

  def self.xml_response(series_id)
    HTTParty.get(build_url(series_id))
  end

  def self.build_url(series_id)
    BASE_URL + API_KEY + '/series/' + series_id.to_s + '/all/en.xml'
  end
end