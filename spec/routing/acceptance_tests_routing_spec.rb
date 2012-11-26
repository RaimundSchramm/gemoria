require 'spec_helper'

describe AcceptanceTestsController do
  describe 'routing' do
    it 'routes to #index' do
      get('/userstories/1/acceptance_tests').should route_to('acceptance_tests#index', userstory_id: '1')
    end

    it 'routes to #new' do
      get('/userstories/1/acceptance_tests/new').should route_to('acceptance_tests#new', userstory_id: '1')
    end

    it 'routes to #create' do
      post('/userstories/1/acceptance_tests').should route_to('acceptance_tests#create', userstory_id: '1')
    end

    it 'routes to #edit' do
      get('/userstories/1/acceptance_tests/1/edit').should route_to('acceptance_tests#edit', userstory_id: '1', id: '1')
    end

    it 'routes to #update' do
      put('/userstories/1/acceptance_tests/1').should route_to('acceptance_tests#update', userstory_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      delete('/userstories/1/acceptance_tests/1').should route_to('acceptance_tests#destroy', userstory_id: '1', id: '1')
    end
  end
end
