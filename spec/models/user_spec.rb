require 'spec_helper'

describe User do
  
  before (:each) do
  	@user = {
  		:name => "Test User",
  		:email => "test@gmail.com",
  		:password => "test1234",
  		:password_confirmation => "test1234"
  	}
  end
  
  #INITIALIZE NEW USER OBJECT
  it "should create a new instance of valid attributes" do
  	User.create!(@user)
  end
  
  #VALIDATIONS
  it "should have an email id" do 
  	haveNoEmail = User.new(@user.merge(:email => ""))
  	haveNoEmail.should_not be_valid
  end
  
  it "should must have valid email address" do
  	emailID = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
  	emailID.each do |aEmail|
  		validEmail = User.new(@user.merge(:email => aEmail))
  		validEmail.should be_valid
  	end
  end
  
end
