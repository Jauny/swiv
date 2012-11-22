require 'spec_helper'

describe "users", :js => true do
  let!(:user) { create(:user) }

  it "signs in/out properly" do
    visit new_user_session_path
    
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"

    page.should have_content("Signed in successfully.")

    click_link "Logout"

    page.should have_content("Signed out successfully.")
  end

  it "signs up properly" do
    visit new_user_registration_path

    fill_in "Name", :with => "Al Capone"
    fill_in "Email", :with => "alc@po.ne"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"

    page.should have_content("Welcome!")
  end
end