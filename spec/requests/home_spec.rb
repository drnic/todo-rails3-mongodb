require 'spec_helper'

describe 'home page' do
  
  it "welcome the users" do
    visit '/'
    page.should have_content('Home')
  end

end
