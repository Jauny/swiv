require 'spec_helper'
describe "users", :js => true do
  let!(:user) { create(:user) }

  it "signs in properly" do
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"

    page.should have_content("Signed in successfully.")
  end
end