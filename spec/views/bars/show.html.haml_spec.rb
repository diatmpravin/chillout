require 'spec_helper'

describe "bars/show" do
  before(:each) do
    @bar = assign(:bar, stub_model(Bar,
      :name => "Name",
      :owner => "Owner",
      :phone => 1,
      :city => "City",
      :website => "Website",
      :addess => "Addess"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Owner/)
    rendered.should match(/1/)
    rendered.should match(/City/)
    rendered.should match(/Website/)
    rendered.should match(/Addess/)
  end
end
