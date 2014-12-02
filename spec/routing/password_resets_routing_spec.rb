require 'spec_helper'

describe 'Reset Password Routing -' do
  describe 'uses RESTful routes:' do
    it 'GET /password_resets/new routes to password_resets#new' do
      expect(get 'password_resets/new').to route_to 'password_resets#new'
    end

    it 'POST /password_resets routes to password_resets#create' do
      expect(post 'password_resets').to route_to 'password_resets#create'
    end

    it 'GET /password_resets/:id/edit routes to password_resets#edit' do
      expect(get 'password_resets/1/edit').to route_to 'password_resets#edit', id: '1'
    end

    it 'PATCH /reset_passwords/1 routes to password_resets#update' do
      expect(patch 'password_resets/1').to route_to 'password_resets#update', id: '1'
    end
  end

  describe 'must not use RESTful routes:' do
    it 'GET /password_resets must not route to password_resets#index' do
      expect(get 'password_resets').to_not be_routable
    end

    it 'DELETE /password_resets/1 must not route to password_resets#destroy' do
      expect(delete 'password_resets/1').to_not be_routable
    end

    it 'GET /password_resets/1 must not route to password_resets#show' do
      expect(get 'password_resets/1').to_not be_routable
    end
  end

  describe 'helpers' do
    it { expect(new_password_reset_path).to eq '/password_resets/new' }
    it { expect(password_resets_path).to eq '/password_resets' }
    it { expect(edit_password_reset_path(1)).to eq '/password_resets/1/edit' }
    it { expect(password_reset_path(1, method: :patch)).to eq '/password_resets/1?method=patch' }
  end
end
