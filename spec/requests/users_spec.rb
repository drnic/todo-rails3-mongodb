require 'spec_helper'

feature "signing up" do

  def sign_in_as(user, password)
    visit new_user_session_path
    fill_in 'Email', :with => user
    fill_in 'Password', :with => password
    click_button 'Sign in'
  end

  def sign_out
    click_on 'Logout'
  end

  before(:each) do
    Factory.create(:john)
  end

  scenario 'signing with correct credentials' do
    sign_in_as('john_lennon@beatles.com', 'beatles')
    page.should have_content('Signed in successfully.')
  end

  scenario "signing with incorrect credentials" do
    sign_in_as('john_lennon@beatles.com.br', 'ironmaiden')
    page.should have_content('Invalid email or password.')
  end

  scenario 'sign in and then sign out' do
    sign_in_as('john_lennon@beatles.com', 'beatles')
    page.should have_content('Signed in successfully.')
    sign_out
    page.should have_content('Signed out successfully.')
  end

end

