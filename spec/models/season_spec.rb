require 'spec_helper'

describe Season do

  it "has many episodes" do
    show = Show.create(name: "test", tvdbid: 123)
    season = Season.create(number:1, show_id: show.id)
    season.episodes.should be_empty
  end

  it "belongs to a show" do
    show = Show.create(name: "test", tvdbid: 123)
    season = Season.create(number:1, show_id: show.id)
    show.seasons.should include(season)
  end

end