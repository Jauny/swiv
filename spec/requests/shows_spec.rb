require 'spec_helper'

describe "shows", :js => true do
  before(:all) do
    @show = FactoryGirl.create(:show)
    @user = FactoryGirl.create(:user)  
  end
  
  describe "GET /shows" do
    it "displays shows" do
      visit shows_path
      page.should have_content("A show")
    end
  end

  describe "GET /show" do
    it "displays the correct show" do
      visit show_path(@show.id)
      page.should have_content("A show")
    end

    it "allows to track a show" do
      visit user_session_path
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      visit show_path(@show.id)
      click_link ("track show")
      page.should have_content("untrack show")
    end
  end

  describe "POST /shows" do
    it "imports a new show" do
      visit show_path(79257)
      page.should have_content('Planet Earth')
    end
  end

end