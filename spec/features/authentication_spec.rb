require 'spec_helper'

feature 'authentication' do
  scenario 'As a User I want to sign up' do
    visit '/'
    click_link 'Sign up'
    expect(current_path).to eq signup_path

    fill_in 'Name', with: 'Raimund'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    expect { click_button 'Sign up' }.to change(User, :count).from(0).to(1)

    expect(page).to have_content 'Thank you for signing up.'
  end

  scenario 'As a User I can not sign up a name twice' do
    visit '/'
    click_link 'Sign up'
    expect(current_path).to eq signup_path

    fill_in 'Name', with: 'Raimund'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    click_button 'Sign up'

    expect(page).to have_content 'Thank you for signing up.'

    visit '/signup'

    fill_in 'Name', with: 'Raimund'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    expect { click_button 'Sign up' }.not_to change(User, :count)

    expect(page).to have_content 'Form is invalid'
  end
end
