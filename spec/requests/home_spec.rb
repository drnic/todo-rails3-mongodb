require 'spec_helper'

describe 'home page' do
  
  it "welcome the todo app" do
    visit '/'
    page.should have_content('Home')
  end

end
