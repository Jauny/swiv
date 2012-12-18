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
    name   = xml['Data']['Series']['SeriesName']
    plot   = xml['Data']['Series']['Overview']
    image  = "http://www.thetvdb.com/banners/" + xml['Data']['Series']['poster']
    banner = "http://www.thetvdb.com/banners/" + xml['Data']['Series']['banner']
    tvdbid = xml['Data']['Series']['id']

    s = Show.new(name: name, plot: plot, image: image, banner: banner, tvdbid: tvdbid )
    s.id = tvdbid
    s.save
    return s
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
      e = Episode.new( number:episode["Combined_episodenumber"],
                      name:episode["EpisodeName"],
                      plot:episode["Overview"],
                      season_id:season.id,
                      air_date:episode["FirstAired"],
                      tvdbid:episode["id"])
      e.id = episode["id"]
      e.save
    end
  end

  def self.xml_response(series_id)
    HTTParty.get(build_url(series_id))
  end

  def self.build_url(series_id)
    BASE_URL + API_KEY + '/series/' + series_id.to_s + '/all/en.xml'
  end


  # For database update ~~~~~~
  
  @last_update_time = 1353542621

  def self.last_update_time
    @last_update_time
  end

  def self.update_all
    servertime = @last_update_time
    shows_updated = find_shows_updated(servertime)

    new_episodes = find_new_episodes(shows_updated)

    add_new_episodes(new_episodes)
  end

  def self.add_new_episodes(new_episodes)
    new_episodes.map   do |episode|
      e = Episode.new( number:episode["Combined_episodenumber"],
                       name:episode["EpisodeName"],
                       plot:episode["Overview"],
                       season_id:episode["Combined_season"],
                       air_date:episode["FirstAired"],
                       tvdbid:episode["id"])

      e.id = episode["id"]
      e.save
    end
  end

  def self.find_new_episodes(shows_updated)
    tvdb_episodes = []
    local_episodes = []

    shows_updated.each do |show|
      tvdb_episodes << HTTParty.get(build_url(show))["Data"]["Episode"]
      local_episodes << Show.find_by_tvdbid(show).seasons.each { |season| season.episodes }.flatten
    end

    tvdb_episodes - local_episodes
  end

  def self.find_shows_updated(servertime)
    results = HTTParty.get("http://www.thetvdb.com/api/Updates.php?type=series&time=" + servertime.to_s)
    @last_update_time = results["Items"]["Time"]
    @updated_series_number = results["Items"]["Series"]
    @local_series = Show.all

    @updated_series_number & @local_series
  end


end
