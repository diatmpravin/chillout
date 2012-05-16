require 'spec_helper'

describe "bars/edit" do
  before(:each) do
    @bar = assign(:bar, stub_model(Bar,
      :name => "MyString",
      :owner => "MyString",
      :phone => 1,
      :city => "MyString",
      :website => "MyString",
      :addess => "MyString"
    ))
  end

  it "renders the edit bar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bars_path(@bar), :method => "post" do
      assert_select "input#bar_name", :name => "bar[name]"
      assert_select "input#bar_owner", :name => "bar[owner]"
      assert_select "input#bar_phone", :name => "bar[phone]"
      assert_select "input#bar_city", :name => "bar[city]"
      assert_select "input#bar_website", :name => "bar[website]"
      assert_select "input#bar_addess", :name => "bar[addess]"
    end
  end
end
