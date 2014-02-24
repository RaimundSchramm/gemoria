require 'spec_helper'

feature 'A new project should have a sprint' do

  before { login create :admin }

  scenario 'full rotation' do

    visit '/projects'
    click_on 'New Project'
    fill_in 'Name', with: 'MyProject'
    click_on 'Save'

    project = Project.last

    expect(current_path).to eq project_path(project)
    expect(Project.count).to eq 1
    expect(project.sprints).to eq [Sprint.last]

    click_on 'Manage userstories'
    expect(current_path).to eq project_userstories_path(project)
  end
end
