require 'spec_helper'

feature 'As a user I want to manage my ownerships of projects' do

  let(:user) { create :user }
  let!(:first) { create :project, name: 'first' }
  let!(:second) { create :project, name: 'second' }

  background do
    login user
  end
 
  scenario 'listing my ownerships' do
    user.projects = [first, second]
    click_link 'Administration'
    expect(current_path).to eq ownerships_path
    expect(page).to have_content('first')
    expect(page).to have_content('second')
  end

  scenario 'creating ownerships' do
    click_link 'Administration'
    expect(current_path).to eq ownerships_path
    expect(page).not_to have_content('first')
    expect(page).not_to have_content('second')
    click_link 'Edit'
    expect(current_path).to eq edit_multiple_ownerships_path
    check 'first'
    check 'second'
    click_button 'Set ownerships'
    expect(page).to have_content 'first'
    expect(page).to have_content 'second'
  end

  scenario 'deleting ownerships' do
    user.projects = [first, second]
    click_link 'Administration'
    click_link 'Edit'
    uncheck 'first'
    uncheck 'second'
    click_button 'Set ownerships'
    expect(page).not_to have_content 'second'
    expect(page).not_to have_content 'first'
  end
end
