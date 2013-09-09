require 'spec_helper'

feature 'authentication' do
  let!(:user) { create :mund }

  background do
    visit '/'
  end

  scenario 'As a User I want to sign up' do
    click_link 'Signup'
    expect(current_path).to eq signup_path

    fill_in 'Name', with: 'Raimund'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    expect { click_button 'Sign up' }.to change(User, :count)

    expect(page).to have_content 'Thank you for signing up.'
  end

  scenario 'As a User I can not sign up a name twice' do
    click_link 'Signup'
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

  # let(:user) { create :mirk }
  scenario 'As a User I want to sign in' do
    click_link 'Login'
    expect(current_path).to eq login_path

    fill_in 'Name', with: 'mund'
    fill_in 'Password', with: 'secret'
    within 'form' do
      click_button 'Log in'
    end

    expect(page).to have_content 'Logged in.'
    expect(page).to have_content 'mund'
  end

  scenario 'As a User I want to sign out' do
    click_link 'Login'
    fill_in 'Name', with: 'mund'
    fill_in 'Password', with: 'secret'
    click_button 'Log in'
    expect(page).to have_link 'Logout'
    click_link 'Logout'
    expect(current_path).to eq login_path
    expect(page).to have_content 'Logged out.'
  end

  scenario 'As a User I want to be signed in after signup' do
    click_link 'Signup'
    fill_in 'Name', with: 'mirk'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    click_button 'Sign up'

    expect(current_path).to eq root_path
    expect(page).to have_content 'mirk'
  end
end
