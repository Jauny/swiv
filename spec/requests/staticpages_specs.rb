require 'spec_helper'

describe "index" do
  
  describe "GET /index" do
    it "does not display calendar if not logged in" do
      visit root_path
      page.should_not have_content('calendar')
    end
  end

end