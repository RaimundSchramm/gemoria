require 'spec_helper'

describe SprintsController do
  describe 'RESTful routing' do
    it 'routes to #update' do
      expect(put('/projects/1/sprints/1')).to route_to('sprints#update', project_id: '1', id: '1')
    end

    it 'routes to #complete' do
      expect(patch('/projects/1/sprints/1/complete')).to route_to('sprints#complete', project_id: '1', id: '1')
    end
  end
end
