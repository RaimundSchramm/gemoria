require 'spec_helper'

# Basic scenario
# AS a Product Owner (Member User)
# WHEN I work on a Userstory
# THEN I want to see only its Acceptance Tests
feature 'AS a Product Owner' do
  let(:mund)      { create :mund }
  let(:project)   { create :project }
  let(:userstory) { create :userstory, project: project }
  #let(:sprint)    { create :sprint, project: project }
  let!(:acceptance_test) { create :acceptance_test, userstory: userstory, description: 'first AT' }
  let!(:task) { create :task, userstory: userstory, name: 'Task 1' }
  let!(:ownership) { create :ownership, project: project, user: mund, role: Role.create(name: 'Product Owner') }

  # WHEN I work on a Userstory 
  background do
    login mund
    visit "/projects/#{project.id}/userstories/#{userstory.id}"
  end

  scenario 'WHEN I work on a Userstory THEN I only want to see its Acceptance Tests' do
    expect(page).to have_content 'first AT'
    expect(page).not_to have_content 'Task 1'
  end
end

feature 'AS a Developer' do
  let(:mund)      { create :mund }
  let(:project)   { create :project }
  let(:userstory) { create :userstory, project: project }
  #let(:sprint)    { create :sprint, project: project }
  let!(:acceptance_test) { create :acceptance_test, userstory: userstory, description: 'first AT' }
  let!(:task) { create :task, userstory: userstory, name: 'Task 1' }
  let!(:ownership) { create :ownership, project: project, user: mund, role: Role.create(name: 'Developer') }

  # WHEN I work on a Userstory 
  background do
    login mund
    visit "/projects/#{project.id}/userstories/#{userstory.id}"
  end

  scenario 'WHEN I work on a Userstory THEN I want to see everything' do
    expect(page).to have_content 'first AT'
    expect(page).to have_content 'Task 1'
  end
end
