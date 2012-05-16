# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    title "MyString"
    description "MyString"
    availability "2012-05-16"
    buy_price 1
    min_bid_price 1
    no_of_guest 1
    status 1
    highest_bid 1
  end
end
