require 'spec_helper'

describe UserstoriesController do
  context 'RESTful actions' do
    it 'routes to #index' do
      get('projects/1/userstories').should route_to('userstories#index', project_id: '1')
    end

    xit 'routes to #new' do
      get('/userstories/new').should route_to('userstories#new')
    end

    xit 'routes to #create' do
      post('/userstories').should route_to('userstories#create')
    end

    xit 'routes to #show' do
      get('/userstories/1').should route_to('userstories#show', id: '1')
    end

    xit 'routes to #update' do
      put('/userstories/1').should route_to('userstories#update', id: '1')
    end

    xit 'routes to #destroy' do
      delete('/userstories/1').should route_to('userstories#destroy', id: '1')
    end
  end

  context 'not routable' do
    xit 'should not route to #edit' do
      get('/userstories/1/edit').should_not be_routable
    end
  end
end
