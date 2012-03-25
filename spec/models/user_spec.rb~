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
  
  it "should reject invalid email id" do
  	emailId = %w[user@foo,com user_at_foo.org example.user@foo.]
  	emailId.each do |aEmail|
  		invalidEmail = User.new(@user.merge(:email => aEmail))
  		invalidEmail.should_not be_valid
  	end
  end
  
  it "should reject duplicate eamil id" do
  	User.create!(@user)
  	duplicateEmail = User.new(@user)
  	duplicateEmail.should_not be_valid
  end
  
  it "should reject email id indentical up to case" do
  	upcaseEmail = @user[:email].upcase
  	User.create!(@user.merge(:email => upcaseEmail))
  	userWithDuplicateEmail = User.new(@user)
  	userWithDuplicateEmail.should_not be_valid
  end
  
  describe "Password" do
		before (:each) do
			@date = User.new(@user)
		end

		it "should have a password attribute" do
      @date.should respond_to(:password)
    end
    
    it "should have a password confirmaton attributes" do
    	@date.should respond_to(:password_confirmation)
    end
	end
	
	describe "password validations" do
		it "should require a password" do
			User.new(@user.merge(:password => "", :password_confirmation => "")).should_not be_valid
		end
		
		it "should require a maching password confirmation" do
			User.new(@user.merge(:password_confirmation => "invalid")).should_not be_valid
		end
		
		it "should reject shor passwords" do
			short = "a"*5
			hash = @user.merge(:password => short, :password_confirmation => short)
			User.new(hash).should_not be_valid
		end
	end
	
	describe "Password encription" do
		before (:each) do
			@data = User.create!(@user)
		end
		
		it "should have an encrypted password attribute" do
      @data.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @data.encrypted_password.should_not be_blank
    end
	end
  
end

