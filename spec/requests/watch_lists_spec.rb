require 'spec_helper'

feature 'watch lists' do

  def sign_in_as(user, password)
    visit new_user_session_path
    fill_in 'Email', :with => user
    fill_in 'Password', :with => password
    click_button 'Sign in'
  end

  background do
    @user = Factory.create(:paul)
    @list = Factory.build(:public_list)
    @task = @list.tasks.build
    @task.name = "Write an article"
    @list.save
  end

  scenario 'watch a public list', :js => true do
    sign_in_as('paul@beatles.com', 'beatles')
    visit lists_path
    click_link 'Things that i need to do today'
    click_on 'Watch'
    page.should have_content('You are watching this list now.')
    visit user_watching_index_path(@user)
    page.should have_content('Things that i need to do today')
  end

  scenario 'unwatch a public list', :js => true do
    sign_in_as('paul@beatles.com', 'beatles')
    visit lists_path
    click_link 'Things that i need to do today'
    click_on 'Watch'
    page.should have_content('You are watching this list now.')
    visit user_watching_index_path(@user)
    page.should have_content('Things that i need to do today')
    click_link 'Things that i need to do today'
    click_on 'Unwatch'
    page.should have_content('You are not watching this list now.')
    visit user_watching_index_path(@user)
    page.should have_content("You don't are watching any list yet.")
  end

end

