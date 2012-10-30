require 'spec_helper'

describe UserstoriesController do
  context 'RESTful actions' do
    it 'routes to #index' do
      get('projects/1/userstories').should route_to('userstories#index', project_id: '1')
    end

    it 'routes to #new' do
      get('projects/1/userstories/new').should route_to('userstories#new', project_id: '1')
    end

    it 'routes to #create' do
      post('projects/1/userstories').should route_to('userstories#create', project_id: '1')
    end

    it 'routes to #show' do
      get('projects/1/userstories/1').should route_to('userstories#show', project_id: '1', id: '1')
    end

    it 'routes to #edit' do
      get('projects/1/userstories/1/edit').should route_to('userstories#edit', project_id: '1', id: '1')
    end

    it 'routes to #update' do
      put('projects/1/userstories/1').should route_to('userstories#update', project_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      delete('projects/1/userstories/1').should route_to('userstories#destroy', project_id: '1', id: '1')
    end
  end

  context 'not routable' do
    it 'should not route to #index unnested' do
      get('/userstories').should_not be_routable
    end

    it 'should not route to #new unnested' do
      get('/userstories/new').should_not be_routable
    end

    it 'should not route to #create unnested' do
      post('/userstories/').should_not be_routable
    end

    it 'should not route to #show unnested' do
      get('/userstories/1').should_not be_routable
    end

    it 'should not route to #edit unnested' do
      get('/userstories/1/edit').should_not be_routable
    end

    it 'should not route to #update unnested' do
      put('/userstories/1').should_not be_routable
    end

    it 'should not route to #delete unnested' do
      delete('/userstories/1').should_not be_routable
    end
  end
end
