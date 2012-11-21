FactoryGirl.define do 
  factory :user do
    name "Chuck Norris"
    email "chucknorris@norris.com"
    password "password"
    password_confirmation "password"
  end
end