require 'spec_helper'

describe UserstoriesController, :type => :routing do
  context 'RESTful actions' do
    it 'routes to #index' do
      expect(get('projects/1/userstories')).to route_to('userstories#index', project_id: '1')
    end

    it 'routes to #new' do
      expect(get('projects/1/userstories/new')).to route_to('userstories#new', project_id: '1')
    end

    it 'routes to #create' do
      expect(post('projects/1/userstories')).to route_to('userstories#create', project_id: '1')
    end

    it 'routes to #show' do
      expect(get('projects/1/userstories/1')).to route_to('userstories#show', project_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get('projects/1/userstories/1/edit')).to route_to('userstories#edit', project_id: '1', id: '1')
    end

    it 'routes to #update' do
      expect(put('projects/1/userstories/1')).to route_to('userstories#update', project_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete('projects/1/userstories/1')).to route_to('userstories#destroy', project_id: '1', id: '1')
    end
  end

  context 'not routable' do
    it 'should not route to #index unnested' do
      expect(get('/userstories')).not_to be_routable
    end

    it 'should not route to #new unnested' do
      expect(get('/userstories/new')).not_to be_routable
    end

    it 'should not route to #create unnested' do
      expect(post('/userstories/')).not_to be_routable
    end

    it 'should not route to #show unnested' do
      expect(get('/userstories/1')).not_to be_routable
    end

    it 'should not route to #edit unnested' do
      expect(get('/userstories/1/edit')).not_to be_routable
    end

    it 'should not route to #update unnested' do
      expect(put('/userstories/1')).not_to be_routable
    end

    it 'should not route to #delete unnested' do
      expect(delete('/userstories/1')).not_to be_routable
    end
  end
end
