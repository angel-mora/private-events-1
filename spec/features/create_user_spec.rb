# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New user', type: :feature do

  scenario 'Create new user' do
  
    visit new_user_path

    fill_in 'user_username', with: 'hero1one'
    fill_in 'user_first_name', with: 'fristhero1'
    fill_in 'user_last_name', with: 'lasthero' 
    fill_in 'user_email', with: 'user@gmail.com' 
    click_button 'create_user'
    expect(page).to have_content 'successfull'
  end

end