require 'spec_helper'

feature 'create user lists' do

  def sign_in_as(user, password)
    visit new_user_session_path
    fill_in 'Email', :with => user
    fill_in 'Password', :with => password
    click_button 'Sign in'
  end

  background do
    @user = Factory.create(:valid_user)
  end

  scenario 'creating a new list with valid parameters' do
    sign_in_as('john_lennon@beatles.com', 'beatles')
    visit new_user_list_path(@user)
    fill_in 'Name', :with => 'Things that i need to do today'
    click_on 'Save'
    page.should have_content('List was successfully created.')
    visit user_lists_path(@user)
    page.should have_content('Things that i need to do today') 
  end

  scenario 'creating a new list with invalid parameters' do
    pending
  end

end
