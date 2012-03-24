
## UTILITY METHODS
def create_visitor
	@visitor ||= { :name => "Test User", :email => "test@gmail.com", :password => "test1234", :password_confirmation => "test1234"}
end

def delete_user
	@user ||= User.first conditions: { :email => @visitor[:email] }
	@user.destroy unless @user.nil?
end

def find_user
	@user ||= User.first conditions: { :email => @visitor[:email]}
end

def sign_up
	delete_user
	visit '/users/sign_up'
	fill_in "Name", :with => @visitor[:name]
	fill_in "Email", :with => @visitor[:email]
	fill_in "Password", :with => @visitor[:password]
	fill_in "Password confirmation", :with => @visitor[:password_confirmation]
	click_button "Sign up"
	find_user
end

def sign_in
	visit '/users/sign_in'
	fill_in "Email", :with => @visitor[:email]	
	fill_in "Password", :with => @visitor[:password]
	click_button "Sign in"
end

## GIVEN
Given /^I an not logged in$/ do
   visit '/users/sign_out'
end

Given /^I am not logged in$/ do
	visit '/users/sign_out'
end

Given /^I exist as a user$/ do
   create_visitor
end

Given /^I do not exist as a user$/ do
   visit '/users/sign_up'
end


## WHEN
When /^I sign in with valid credentials$/ do
   create_visitor
   sign_in
end

When /^I sign up with valid user data$/ do
	create_visitor
   sign_up
end

When /^I sign up with a invalid email$/ do
   create_visitor
   @visitor = @visitor.merge(:email => "notAEmail")
   sign_up
end

When /^I signs up wihtout password$/ do
   create_visitor
   @visitor = @visitor.merge(:password => "")
   sign_up
end

When /^I sign up without a password confirmation$/ do
   create_visitor
   @visitor = @visitor.merge(:password_confirmation =>"")
   sign_up
end

When /^I signs up mismatched password confirmation$/ do
   create_visitor
   @visitor = @visitor.merge(:password_confirmation => "testing1234")
   sign_up
end

When /^I return to the site$/ do
   visit '/'
end


## THEN
Then /^I should see a successful sign up message$/ do
	page.should have_content "Welcome! You have signed up successfully."  
end

Then /^I should see an invalid email message$/ do
	page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see mismatched password$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I see an invalid login message$/ do
   page.should have_content "Invalid email or password."
end

Then /^I should be signed out$/ do
   page.should have_content "Sign up"
   page.should have_content "Login"
   page.should_not have_content "Logout"
end

Then /^I see a successful sign in message$/ do
   page.should have_content "Signed in successfully."
end

Then /^I Should be signed in$/ do
   page.should have_content "Logout"
   page.should_not have_content "Sign up"
   page.should_not have_content "Login"
end






