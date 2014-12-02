require 'spec_helper'

feature 'resetting password' do

  let!(:user) { create :mund, email: 'mund@test.com' }

  background do
    visit '/'
  end

  scenario 'As a signed-up User I want to reset my password' do
    # 1 - resource: new password reset
    # add a link to the login form
    # add route
    # add controller and new action
    # add password-reset-form aka new-form
    click_link 'Login'
    click_link 'forgotten password?'
    expect(current_path).to eq new_password_reset_path

    # 2 - resource: create password reset
    # new-form requests create action
    # add route
    # add create action
    # add method to user model
    # add migration
    # add mailer
    # add mailer template
    fill_in 'Email', with: 'mund@test.com'
    click_button 'Reset Password'
    expect(current_path).to eq password_resets_path

    # 3 - resource: edit password reset
    # add route
    # add edit action
    # add edit form
    user.reload
    visit "http://localhost:3000/password_resets/#{user.password_reset_token}/edit"
    fill_in 'Password', with: 'new'
    fill_in 'Password confirmation', with: 'new'
    click_button 'Reset Password'
    expect(current_path).to eq root_path

    # 4 - resource: update password reset
    # add route
    # add update action
    click_on 'Login'
    fill_in 'Name', with: 'mund'
    fill_in 'Password', with: 'new'
    click_button 'Log in'
    expect(page).to have_content 'Logged in'
  end
end
