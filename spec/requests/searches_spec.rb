require 'spec_helper'

describe "search", :js => true do
  it "returns tvdb's result" do
    visit root_path
    fill_in "search", :with => "broke"
    click_button "Search"

    page.should have_content("2 Broke Girls")
  end

  it "returns a single show" do
    visit root_path
    fill_in "search", :with => "girls"
    click_button "Search"
    
    page.should have_content("Girls Bravo")
  end

  it "returns multiple shows" do
    visit root_path
    fill_in "search", :with => "2 broke girls"
    click_button "Search"
    
    page.should have_content("2 Broke Girls")
  end

  it "returns an error if no show is found" do
    visit root_path
    fill_in "search", :with => "ahsjdhdsjgbsf"
    click_button "Search"
    
    page.should have_content("No show found!")
  end
end