require 'rails_helper'

describe User, :type => :model do
	it "has a valid factory" do 
  	user = FactoryGirl.build(:user)
  	expect(user).to be_valid
  end

  it "is invalid without a email" do 
  	user = FactoryGirl.build(:user, email: nil)
  	expect(user).to_not be_valid
  end

  it "is invalid without a password and password confirmation" do 
  	user = FactoryGirl.build(:user, password: nil, password_confirmation: nil)
  	expect(user).to_not be_valid
  end

  it "is invalid if password confirmation is not the same as password" do 
  	user = FactoryGirl.build(:user, password: "example123", password_confirmation:"not_example1234")
  	expect(user).to_not be_valid
  end

  it "is invalid without a harvest_client_id" do 
  	user = FactoryGirl.build(:user, harvest_client_id:nil)
  	expect(user).to_not be_valid
  end

  it "creates an authentication token when created" do
  	user = FactoryGirl.create(:user)
  	expect(user.authentication_token).to be_present
  end

  it "creates an authentication token when saved" do
  	user = FactoryGirl.create(:user)
  	user.authentication_token = nil
  	user.save
  	expect(user.authentication_token).to be_present
  end
end
