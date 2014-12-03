require 'spec_helper'

describe AcceptanceTestsController, :type => :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get('/userstories/1/acceptance_tests')).to route_to('acceptance_tests#index', userstory_id: '1')
    end

    it 'routes to #new' do
      expect(get('/userstories/1/acceptance_tests/new')).to route_to('acceptance_tests#new', userstory_id: '1')
    end

    it 'routes to #create' do
      expect(post('/userstories/1/acceptance_tests')).to route_to('acceptance_tests#create', userstory_id: '1')
    end

    it 'routes to #edit' do
      expect(get('/userstories/1/acceptance_tests/1/edit')).to route_to('acceptance_tests#edit', userstory_id: '1', id: '1')
    end

    it 'routes to #update' do
      expect(put('/userstories/1/acceptance_tests/1')).to route_to('acceptance_tests#update', userstory_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete('/userstories/1/acceptance_tests/1')).to route_to('acceptance_tests#destroy', userstory_id: '1', id: '1')
    end
  end
end
