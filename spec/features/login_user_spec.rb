# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User login', type: :feature do

  scenario 'first create new user then log in' do
  
    visit new_user_path

    fill_in 'user_username', with: 'hero'
    fill_in 'user_first_name', with: 'fristhero1'
    fill_in 'user_last_name', with: 'lasthero' 
    fill_in 'user_email', with: 'hero@gmail.com' 
    click_button 'create_user'
    expect(page).to have_content 'successfull'

    click_link 'logout'

    expect(page).to have_content 'You have been logged out'
   
    visit login_path
    fill_in 'username', with: 'hero'  
    fill_in 'email', with: 'hero@gmail.com' 
    click_button 'login'

    expect(page).to have_content 'Logged in'
  end

end