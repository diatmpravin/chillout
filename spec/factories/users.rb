# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user do
		name 'Test User'
		email 'test@gmail.com'
		password 'test1234'
		password_confirmation 'test1234'
		#REQUIRED IF THE DEVISE CONFRIMABLE MODEL IS IN USED
		#confirmed_at Time.now
	end
end
