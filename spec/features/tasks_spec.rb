require 'spec_helper'

feature Tasks do

  # There is a User AND
  let!(:mund)      { create :mund }
  # there is a Project AND
  let!(:project)   { create :project, name: 'MyProject' }
  # the User has an Ownership in the Project
  # AS a Developer AND
  let!(:role)      { create :role, name: 'Developer' }
  let!(:ownership) { create :ownership, user: mund, project: project, role: role }
  # the Project has a Userstory
  let!(:userstory) { create :userstory, project: project, description: 'MyUserstory' }

  background { login mund }

  scenario 'adding a Task with an order number', js: true do
    visit "/projects/#{project.id}/userstories/#{userstory.id}"
    within 'div.content header h1' do
      expect(page).to have_content 'MyUserstory'
    end
    click_on 'New task'
    within 'form.new_task' do
      expect(page).to have_content 'Number'
    end
    fill_in 'Number', with: '1'
    click_on 'Save'
    within 'section#tasks' do
      expect(page).to have_content '1'
    end
  end
end
