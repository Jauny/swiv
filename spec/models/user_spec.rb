require 'spec_helper'

describe User do 
  it "is invalid without a name" do
    user = User.new
    user.should_not be_valid
  end

  it "is invalid without an email" do
    user = User.new(name: "jo")
    user.should_not be_valid
  end

  it "is invalid with no unique email" do
    user = User.new(name: "jo", email: "user@example.com")
    user2 = User.new(name: "jo", email: "user@example.com")

    user2.should_not be_valid
  end
end