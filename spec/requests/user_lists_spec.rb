require 'spec_helper'

feature 'create todo lists' do

  def sign_in_as(user, password)
    visit new_user_session_path
    fill_in 'Email', :with => user
    fill_in 'Password', :with => password
    click_button 'Sign in'
  end

  background do
    @user = Factory.create(:user)
  end

  scenario 'creating a new list with empty tasks with valid parameters' do
    sign_in_as('john_lennon@beatles.com', 'beatles')
    visit new_user_list_path(@user)
    fill_in 'Name', :with => 'Things that i need to do today'
    click_on 'Save'
    page.should have_content('List was successfully created.')
    visit user_lists_path(@user)
    page.should have_content('Things that i need to do today')
  end

  scenario 'creating a new list with empty tasks with invalid parameters' do
    sign_in_as('john_lennon@beatles.com', 'beatles')
    visit new_user_list_path(@user)
    click_on 'Save'
    page.should have_content("Name can't be blank")
  end

  scenario 'creating a new list with a task', :js => true do
    sign_in_as('john_lennon@beatles.com', 'beatles')
    visit new_user_list_path(@user)
    fill_in 'Name', :with => 'Things that i need to do today'
    fill_in 'list_tasks_attributes_0_name', :with => "Write an article."
    click_on 'Save'
    page.should have_content('List was successfully created.')
    visit user_lists_path(@user)
    page.should have_content('Things that i need to do today')
    click_link 'Things that i need to do today'
    page.should have_content('Write an article.')
  end

  scenario 'creating a new public list with a task', :js => true do
    Factory.create(:test_user)
    sign_in_as('john_lennon@beatles.com', 'beatles')
    visit new_user_list_path(@user)
    fill_in 'Name', :with => 'Things that i need to do today'
    check 'list_public'
    fill_in 'list_tasks_attributes_0_name', :with => "Write an article."
    click_on 'Save'
    click_on 'Logout'
    sign_in_as('test@test.com', 'test123')
    visit lists_path
    page.should have_content('Things that i need to do today')
  end

end

