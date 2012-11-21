require "spec_helper"

describe TasksController do
  describe 'RESTful routing to actions' do
    context 'tasks are nested to userstories' do
      it "routes to #index" do
        get("/userstories/1/tasks").should route_to("tasks#index", userstory_id: '1')
      end

      it "routes to #new" do
        get("/userstories/1/tasks/new").should route_to("tasks#new", userstory_id: '1')
      end

      it "routes to #create" do
        post("/userstories/1/tasks").should route_to("tasks#create", userstory_id: '1')
      end

      it "routes to #show" do
        get("/userstories/1/tasks/1").should route_to("tasks#show", userstory_id: '1', :id => "1")
      end

      it "routes to #edit" do
        get("/userstories/1/tasks/1/edit").should route_to("tasks#edit", userstory_id: '1', :id => "1")
      end

      it "routes to #update" do
        put("/userstories/1/tasks/1").should route_to("tasks#update", userstory_id: '1', :id => "1")
      end

      it "routes to #destroy" do
        delete("/userstories/1/tasks/1").should route_to("tasks#destroy", userstory_id: '1', :id => "1")
      end
    end
  end

  context 'not routable' do
    it 'should not route to #index unnested' do
      get('/tasks').should_not be_routable
    end

    it 'should not route to #new unnested' do
      get('/tasks/new').should_not be_routable
    end

    it 'should not route to #create unnested' do
      post('/tasks/').should_not be_routable
    end

    it 'should not route to #show unnested' do
      get('/tasks/1').should_not be_routable
    end

    it 'should not route to #edit unnested' do
      get('/tasks/1/edit').should_not be_routable
    end

    it 'should not route to #update unnested' do
      put('/tasks/1').should_not be_routable
    end

    it 'should not route to #delete unnested' do
      delete('/tasks/1').should_not be_routable
    end
  end

end
