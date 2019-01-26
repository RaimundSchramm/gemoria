require 'spec_helper'

# feature 'AS a User WHEN i create a userstory' do
#   let(:project) { create :project }

#   scenario 'THEN i want to select a category' do
#     visit "/projects/#{project.id}/userstories"
#     click_on 'New userstory'
#     select 'Feature', from: 'Category'
#     click_on 'Save'
#     page.should have_content 'Feature'
#   end
# end

# feature 'manage userstories' do
#   let(:project) { create :project }

#   scenario 'new userstory replaces link with form' do
#     visit "/projects/#{project.id}/userstories"
#     click_on 'New userstory'
#     page.should have_selector('form#new_userstory')
#     page.should_not have_selector('a#new_userstory_link').visible?
#   end

#   scenario 'clicking close button replaces form with link' do
#     #visit "/projects/#{project.id}/userstories"
#     visit project_userstories_path(project)
#     click_on 'New userstory'
#     page.should have_selector('form#new_userstory')
#     page.should have_selector('button.close')
#     find('button.close').click
#     page.should_not have_selector('form#new_userstory')
#     page.should have_selector('a#new_userstory_link[display=true]')
#   end
# end
