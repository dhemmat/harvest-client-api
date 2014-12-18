# This will guess the User class
FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "example123"
    password_confirmation "example123"
    harvest_client_id "123456"
  end
end
