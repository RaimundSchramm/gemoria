require 'spec_helper'

describe ApplicationController, :type => :controller do

  controller do
    def index
    end
  end

  describe 'exceptions' do
    let(:user) { build :admin }

    it 'handles authorizable but Not-authenticated' do
      current_permission = Permission.new(user)
      allow(controller).to receive(:current_user).and_return nil
      allow(controller).to receive(:current_permission).and_return current_permission

      get :index
      expect(response).to redirect_to login_path
      expect(flash[:alert]).to eq 'You are not authenticated to view this page. Please log in or sign up at first.'
    end

    it 'handles Not-authorized but authenticatable' do
      current_permission = Permission.new(user)
      allow(controller).to receive(:current_user).and_return user
      allow(controller).to receive(:current_permission).and_return current_permission
      allow(current_permission).to receive(:allow?).and_return false

      get :index
      expect(response).to redirect_to root_path
      expect(flash[:alert]).to eq 'Not authorized'
    end
  end

  describe 'delegates and helpers' do
    it 'delegates allow to current_permission' do
      expect(controller).to respond_to :allow?
    end
  end

  describe 'private methods' do
    it 'sets the current_user' do
      get :index
      expect(controller.send(:current_user)).to be_nil
    end

    it 'sets the current_permission' do
      get :index
      expect(controller.send(:current_user)).to be_nil
    end
  end
end
