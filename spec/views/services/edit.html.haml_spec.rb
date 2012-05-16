require 'spec_helper'

describe "services/edit" do
  before(:each) do
    @service = assign(:service, stub_model(Service,
      :title => "MyString",
      :description => "MyString",
      :buy_price => 1,
      :min_bid_price => 1,
      :no_of_guest => 1,
      :status => 1,
      :highest_bid => 1
    ))
  end

  it "renders the edit service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => services_path(@service), :method => "post" do
      assert_select "input#service_title", :name => "service[title]"
      assert_select "input#service_description", :name => "service[description]"
      assert_select "input#service_buy_price", :name => "service[buy_price]"
      assert_select "input#service_min_bid_price", :name => "service[min_bid_price]"
      assert_select "input#service_no_of_guest", :name => "service[no_of_guest]"
      assert_select "input#service_status", :name => "service[status]"
      assert_select "input#service_highest_bid", :name => "service[highest_bid]"
    end
  end
end
