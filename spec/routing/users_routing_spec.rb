require 'spec_helper'

describe 'routing Users' do

  context 'custom routes' do
    it 'GET /signup routes to users#new' do
      expect(get('/signup')).to route_to('users#new')
    end
  end

  context 'used RESTful routes' do
    it 'GET /users/new routes to users#new' do
      expect(get('/users/new')).to route_to('users#new')
    end

    it 'POST /users routes to users#create' do
      expect(post('/users')).to route_to('users#create')
    end
  end

  context 'not used RESTful routes' do
    it 'GET /users is excluded' do
      expect(get('/users')).not_to be_routable
    end

    it 'GET /users/:id is excluded' do
      expect(get('/users/1')).not_to be_routable
    end

    it 'GET /users/:id/edit is excluded' do
      expect(get('/users/1/edit')).not_to be_routable
    end

    it 'PUT /users/:id is excluded' do
      expect(put('/users/1')).not_to be_routable
    end

    it 'DELETE /users/:id is excluded' do
      expect(delete('/users/1')).not_to be_routable
    end
  end
end
