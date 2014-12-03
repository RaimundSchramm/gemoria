require 'spec_helper'

describe OwnershipsController, :type => :routing do
  describe 'RESTful routes' do
    it 'GET /ownerships routes to ownerships#index' do
      expect(get '/ownerships').to route_to 'ownerships#index'
    end
  end

  describe 'custom routes' do
    it 'GET /ownerships/edit_multiple routes to ownerships#edit_multiple' do
      expect(get '/ownerships/edit_multiple').to route_to 'ownerships#edit_multiple'
    end

    it 'POST /ownerships/create_or_delete_multiple routes to ownerships#create_or_delete_multiple' do
      expect(post '/ownerships/create_or_delete_multiple').to route_to 'ownerships#create_or_delete_multiple'
    end
  end

  describe 'excluded RESTful routes' do
    it 'GET /ownership should not route to ownerships#show' do
      expect(get '/ownerships/1').not_to be_routable
    end

    it 'GET /ownership/1/edit should not route to ownerships#edit' do
      expect(get '/ownerships/1/edit').not_to be_routable
    end

    it 'PUT /ownership/1 should not route to ownerships#update' do
      expect(put '/ownerships/1').not_to be_routable
    end

    it 'DELETE /ownerships/1 should not route to ownerships#destroy' do
      expect(delete '/ownerships/1').not_to be_routable
    end
  end

end
