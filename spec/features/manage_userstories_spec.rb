require 'spec_helper'

# feature 'manage userstories' do
#   let(:project) { create :project }

#   xscenario 'new userstory replaces link with form', js: true do
#     visit "/projects/#{project.id}/userstories"
#     click_on 'New userstory'
#     page.should have_selector('form#new_userstory')
#     page.should_not have_selector('a#new_userstory_link').visible?
#   end

#   xscenario 'clicking close button replaces form with link', js: true do
#     #visit "/projects/#{project.id}/userstories"
#     visit project_userstories_path(project)
#     click_on 'New userstory'
#     page.should have_selector('form#new_userstory')
#     page.should have_selector('button.close')
#     find('button.close').click
#     page.should_not have_selector('form#new_userstory')
#     page.should have_selector('a#new_userstory_link[display=true]')
#   end

#end
