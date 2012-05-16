require 'spec_helper'

describe "bars/index" do
  before(:each) do
    assign(:bars, [
      stub_model(Bar,
        :name => "Name",
        :owner => "Owner",
        :phone => 1,
        :city => "City",
        :website => "Website",
        :addess => "Addess"
      ),
      stub_model(Bar,
        :name => "Name",
        :owner => "Owner",
        :phone => 1,
        :city => "City",
        :website => "Website",
        :addess => "Addess"
      )
    ])
  end

  it "renders a list of bars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Owner".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Addess".to_s, :count => 2
  end
end
