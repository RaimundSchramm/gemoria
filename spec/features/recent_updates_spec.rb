require 'spec_helper'

feature 'recent updates in userstories' do
  scenario 'list recently updated userstories' do
    project   = create :project
    userstory = create :userstory, project: project, status: 'opened', description: 'I was updated recently'
    visit '/'
    #save_and_open_page
    within 'section#recent' do
      page.should_not have_content 'I was updated recently'
    end
    visit "projects/#{project.id}/userstories/#{userstory.id}"
    click_on 'Mark as recent'
    visit '/'
    within 'section#recent' do
      page.should have_content 'I was updated recently'
    end
  end
end
