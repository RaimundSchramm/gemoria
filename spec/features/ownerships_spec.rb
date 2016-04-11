require 'spec_helper'

feature 'As a user I want to manage my ownerships of projects' do

  let(:user) { create :admin }
  let!(:first) { create :project, name: 'first' }
  let!(:second) { create :project, name: 'second' }

  background do
    login user
  end

  scenario 'listing my ownerships' do
    user.projects = [first, second]
    click_dropdown 'Administration'
    click_link 'Ownerships'
    expect(current_path).to eq ownerships_path
    expect(page).to have_content('first')
    expect(page).to have_content('second')
  end

  scenario 'creating ownerships' do
    click_dropdown 'Administration'
    click_link 'Ownerships'
    expect(current_path).to eq ownerships_path
    expect(page).not_to have_content('first')
    expect(page).not_to have_content('second')
    click_link 'Edit Ownerships'
    expect(current_path).to eq edit_multiple_ownerships_path
    check 'first'
    check 'second'
    click_button 'Set ownerships'
    expect(page).to have_content 'first'
    expect(page).to have_content 'second'
  end

  scenario 'deleting ownerships' do
    user.projects = [first, second]
    click_dropdown 'Administration'
    click_link 'Ownerships'
    click_link 'Edit Ownerships'
    uncheck 'first'
    uncheck 'second'
    click_button 'Set ownerships'
    expect(page).not_to have_content 'second'
    expect(page).not_to have_content 'first'
  end

  scenario 'adding a scrum role to an ownership' do
    Role.create name: 'Developer'
    user.projects = [first, second]
    click_dropdown 'Administration'
    click_link 'Ownerships'
    expect(page).to have_content 'Project Name'
    expect(page).to have_content 'Scrum Role'
    expect(page).to have_content 'Action'

    click_link 'Edit Ownerships'
    expect(page).to have_content 'Ownership'
    expect(page).to have_content 'Project Name'
    expect(page).to have_content 'Scrum Role'

    check 'first'
    uncheck 'second'
    click_button 'Set ownerships'
    expect(page).not_to have_content 'second'
    expect(page).to have_content 'first'

    click_link 'Edit'
    expect(page).to have_content 'Project Name'
    expect(page).to have_content 'Scrum Role'
    select 'Developer', from: 'ownership_role_id'
    click_on 'Update'
    within "#ownership_#{Ownership.last.id}" do
      expect(page).to have_content 'Developer'
    end
  end
end
