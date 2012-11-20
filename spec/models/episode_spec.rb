require 'spec_helper'

describe Episode do
  it "is invalid without a tvdbid" do
    ep = Episode.new(name: "testep")
    ep.should_not be_valid
  end

  it "is invalid without a name" do
    ep = Episode.new(tvdbid: 1234)
    ep.should_not be_valid 
  end

  it "marks itself as seen by a user" do
    user = User.new
    ep = Episode.new(name: "test", tvdbid: 123)
    ep.mark_seen(user)
    user.episodes.should include(ep)
  end

  it "checks if it has been seen by a user" do
    user = User.new
    ep = Episode.new(name: "test", tvdbid: 123)
    ep.mark_seen(user)
    ep.seen?(user).should be_true
  end
end