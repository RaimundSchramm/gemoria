require 'spec_helper'

describe DashboardsController do

  render_views

  let(:user)    { create :admin }
  let(:project) { create :project }

  def valid_session
    { user_id: user.id }
  end

  describe 'GET show' do
    it 'is successful' do
      get :show, {}, valid_session
      expect(response).to be_success
    end

    it 'assigns current user' do
      get :show, {}, valid_session
      expect(assigns(:current_user)).to eq user
    end

    it 'assigns all owned projects' do
      user.projects = [project]
      get :show, {}, valid_session
      expect(assigns(:owned_projects)).not_to be_nil
    end

    it 'renders show' do
      get :show, {}, valid_session
      expect(response).to render_template 'show'
    end

    xit 'assigns all recent updates'
  end
end
