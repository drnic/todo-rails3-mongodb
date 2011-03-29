require 'spec_helper'

describe "lists/show.html.erb" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
