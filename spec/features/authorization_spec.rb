require 'spec_helper'

feature 'authorization' do

  scenario 'As a new user When I sign up I am a non-admin user' do
    sign_up_user({ name: 'New user', password: 'secret', password_confirmation: 'secret' })
    expect(User.count).to eq 1
    expect(User.last.admin?).to be_false
    expect(current_path).to eq '/'
  end

  scenario 'As a guest (no user) I am restricted to certain pages' do
    visit administration_path
    expect(page).to have_content 'Not authorized'
  end

  scenario 'As an admin I can request every page' do
    login create(:admin)
    visit administration_path
    expect(page).not_to have_content 'Not authorized'
  end

  scenario 'As a member (non-admin) I am restricted to certain pages' do
    login create(:non_admin)
    visit administration_path
    expect(page).to have_content 'Not authorized'
  end
end
