require "spec_helper"

describe TasksController, :type => :routing do
  describe 'RESTful routing to actions' do
    context 'tasks are nested to userstories' do
      it "routes to #index" do
        expect(get("/userstories/1/tasks")).to route_to("tasks#index", userstory_id: '1')
      end

      it "routes to #new" do
        expect(get("/userstories/1/tasks/new")).to route_to("tasks#new", userstory_id: '1')
      end

      it "routes to #create" do
        expect(post("/userstories/1/tasks")).to route_to("tasks#create", userstory_id: '1')
      end

      it "routes to #show" do
        expect(get("/userstories/1/tasks/1")).to route_to("tasks#show", userstory_id: '1', :id => "1")
      end

      it "routes to #edit" do
        expect(get("/userstories/1/tasks/1/edit")).to route_to("tasks#edit", userstory_id: '1', :id => "1")
      end

      it "routes to #update" do
        expect(put("/userstories/1/tasks/1")).to route_to("tasks#update", userstory_id: '1', :id => "1")
      end

      it "routes to #destroy" do
        expect(delete("/userstories/1/tasks/1")).to route_to("tasks#destroy", userstory_id: '1', :id => "1")
      end
    end
  end

  context 'not routable' do
    it 'should not route to #index unnested' do
      expect(get('/tasks')).not_to be_routable
    end

    it 'should not route to #new unnested' do
      expect(get('/tasks/new')).not_to be_routable
    end

    it 'should not route to #create unnested' do
      expect(post('/tasks/')).not_to be_routable
    end

    it 'should not route to #show unnested' do
      expect(get('/tasks/1')).not_to be_routable
    end

    it 'should not route to #edit unnested' do
      expect(get('/tasks/1/edit')).not_to be_routable
    end

    it 'should not route to #update unnested' do
      expect(put('/tasks/1')).not_to be_routable
    end

    it 'should not route to #delete unnested' do
      expect(delete('/tasks/1')).not_to be_routable
    end
  end

end
