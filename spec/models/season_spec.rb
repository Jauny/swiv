require 'spec_helper'

describe Season do
  let!(:show)   { Show.create(name: "test", tvdbid: 123) }
  let!(:season) { Season.create(number:1, show_id: show.id) }

  its(:episodes) { should be_empty }

  it "belongs to a show" do
    show.seasons.should include(season)
  end

end