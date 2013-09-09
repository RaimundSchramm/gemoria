require 'spec_helper'

describe 'routing sessions' do

  describe 'custom routes' do
    it 'GET /login routes to sessions#new' do
      expect(get '/login').to route_to 'sessions#new'
    end

    it 'DELETE /logout routes to sessions#destroy' do
      expect(delete '/logout').to route_to 'sessions#destroy'
    end
  end

  describe 'used RESTful routes' do
    it 'GET /sessions/new routes to sessions#new' do
      expect(get '/sessions/new').to route_to 'sessions#new'
    end

    it 'POST /sessions routes to sessions#create' do
      expect(post '/sessions').to route_to 'sessions#create'
    end

    it 'DELETE /sessions routes to sessions#destroy' do
      expect(delete '/sessions/anything').to route_to 'sessions#destroy', id: 'anything'
    end
  end

  describe 'not used RESTful routes' do
    it 'GET /sessions is excluded' do
      expect(get '/sessions').not_to be_routable
    end

    it 'GET /sessions/1 is excluded' do
      expect(get '/sessions/1').not_to be_routable
    end

    it 'GET /sessions/1/edit is excluded' do
      expect(get '/sessions/1/edit').not_to be_routable
    end

    it 'PUT /sessions is excluded' do
      expect(put '/sessions/1').not_to be_routable
    end
  end
end
