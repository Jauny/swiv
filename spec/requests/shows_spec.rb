require 'spec_helper'

describe "shows", :js => true do
  let!(:show) { create(:show) }
  let!(:user2)    { create(:user) }
  
  describe "GET /shows" do
    it "displays shows" do
      visit shows_path
      page.should have_content(show.name)
    end
  end

  describe "GET /show" do
    it "displays the correct show" do
      visit show_path(show.tvdbid)
      page.should have_content(show.name)
    end

    it "allows to track a show" do
      visit user_session_path
      fill_in "Email", :with => user2.email
      fill_in "Password", :with => user2.password
      click_button "Sign in"

      visit show_path(show.tvdbid)
      click_link ("track show")

      page.should have_content("untrack show")
    end
  end

  describe "POST /shows" do
    it "imports a new show" do
      visit show_path(79842)
      page.should have_content('Season')
    end
  end

end