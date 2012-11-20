require 'spec_helper'

describe Show do
  it "is invalid without a name" do
   show = Show.new
   show.should_not be_valid 
  end

  it "is invalid without a tvdbid" do
    show = Show.new(name: "show")
    show.should_not be_valid
  end

  it "doesn't import a wrong tvdbid" do
    tvdbid = 222
    expect { Show.form_tvdb(tvdbid) }.to raise_error
  end
end