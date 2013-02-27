require 'spec_helper'

describe SprintsController do
  render_views

  let(:project) { create :project }
  let(:sprint)  { create :sprint, project_id: project.id }

  describe 'PUT update' do
    it 'assigns the project' do
      put :update, { project_id: sprint.project.to_param, id: sprint.to_param, sprint: { complete: true } }, {}
      expect(assigns(:project)).to eq project
    end

    it 'assigns the sprint' do
      put :update, { project_id: sprint.project.to_param, id: sprint.to_param, sprint: { complete: true } }, {}
      expect(assigns(:sprint)).to eq sprint
    end

    it 'updates the sprint' do
      put :update, { project_id: sprint.project.to_param, id: sprint.to_param, sprint: { complete: true } }, {}
      expect(assigns(:sprint).complete).to eq true
    end

    it 'redirects to index for html request' do
      put :update, { project_id: sprint.project.to_param, id: sprint.to_param, sprint: { complete: true }  }, {}
      expect(response).to redirect_to project_userstories_path(sprint.project)
    end
  end

  describe 'PUT complete' do
    it 'assigns the project' do
      put :update, { project_id: sprint.project.to_param, id: sprint.to_param, sprint: { complete: true } }, {}
      expect(assigns(:project)).to eq project
    end

    it 'assigns the sprint' do
      put :complete, { project_id: sprint.project.to_param, id: sprint.to_param }, {}
      expect(assigns(:sprint)).to eq sprint
    end

    it 'updates the sprint' do
      put :complete, { project_id: sprint.project.to_param, id: sprint.to_param }, {}
      expect(assigns(:sprint).complete).to eq true
    end

    it 'redirects to index for html request' do
      put :complete, { project_id: sprint.project.to_param, id: sprint.to_param }, {}
      expect(response).to redirect_to project_userstories_path(sprint.project)
    end
  end
end
