require 'spec_helper'

describe "services/index" do
  before(:each) do
    assign(:services, [
      stub_model(Service,
        :title => "Title",
        :description => "Description",
        :buy_price => 1,
        :min_bid_price => 2,
        :no_of_guest => 3,
        :status => 4,
        :highest_bid => 5
      ),
      stub_model(Service,
        :title => "Title",
        :description => "Description",
        :buy_price => 1,
        :min_bid_price => 2,
        :no_of_guest => 3,
        :status => 4,
        :highest_bid => 5
      )
    ])
  end

  it "renders a list of services" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
