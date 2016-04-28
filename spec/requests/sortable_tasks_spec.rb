require 'rails_helper'

RSpec.describe 'Sortable tasks', :type => :request do

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

  describe 'dragging a Task' do
    it 'updates its position' do
      first_task  = create :task, userstory: userstory, number: 1, name: 'first'
      second_task = create :task, userstory: userstory, number: 2, name: 'second'

      post '/sessions', name: 'mund', password: 'secret', password_confirmation: 'secret'

      get "/projects/#{project.id}/userstories/#{userstory.id}"
      expect(response).to render_template 'userstories/show'

      assert_select '#tasks', /1/
      assert_select '#tasks', /2/

      put sort_userstory_tasks_path(userstory), { task: [2, 1] }

      expect(first_task.reload.number).to eq 2
      expect(second_task.reload.number).to eq 1
    end
  end

end
