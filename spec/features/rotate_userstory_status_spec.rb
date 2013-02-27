require 'spec_helper'

feature 'A userstory should have a rotating status' do
  scenario 'full status rotation' do
    project   = create :project
    userstory = create :userstory, project: project
    sprint    = create :sprint, project: project
    visit "/projects/#{project.id}/userstories/#{userstory.id}"
    expect(page).to have_content userstory.full_name
    expect(page).to have_content project.name
    within "section#status" do
      expect(page).to have_content 'opened'
    end
    page.has_css?("section#status.#{userstory.status}")
    expect(page).to have_link 'Start'

    click_link 'Start'
    expect(page).to have_content 'started'
    page.has_css?("section#status.#{userstory.status}")
    expect(page).to have_link 'Complete'

    click_link 'Complete'
    expect(page).to have_content 'completed'
    page.has_css?("section#status.#{userstory.status}")
    expect(page).to have_link 'Accept'

    expect(page).to have_link 'Reject'
    click_link 'Reject'
    expect(page).to have_content 'rejected'
    page.has_css?("section#status.#{userstory.status}")
    expect(page).to have_link 'Start'

    click_link 'Start'
    expect(page).to have_content 'started'
    page.has_css?("section#status.#{userstory.status}")
    expect(page).to have_link 'Complete'

    click_link 'Complete'
    expect(page).to have_content 'completed'
    page.has_css?("section#status.#{userstory.status}")
    expect(page).to have_link 'Accept'
    expect(page).to have_link 'Reject'

    click_link 'Accept'
    expect(page).to have_content 'accepted'
    page.has_css?("section#status.#{userstory.status}")
  end
end