require 'spec_helper'

# In order to update the next business value
# As a product owner
# I want to have a dashboard as entry page
#   for quick overview of all my projects and recent updates

# Given I am a product owner
# And I am member of a project
# When I login
# Then I want to see my dashboard
feature 'Dashboard' do

  let(:mund) { create :mund }

  background { login mund }

  scenario 'is the entry page after login' do
    expect(current_path).to eq dashboard_path
    expect(page).to have_content 'Dashboard'
  end

  scenario 'lists only those projects current user is owner of' do
    mund.projects.create name: 'first'
    create :project, name: 'second'
    click_link 'Dashboard'
    expect(page).to have_content 'first'
    expect(page).not_to have_content 'second'
  end
end
