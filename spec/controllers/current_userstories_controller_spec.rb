require 'spec_helper'

describe CurrentUserstoriesController do
  render_views

  describe 'GET #index' do
    it 'renders index template' do
      get('index')
      response.should render_template('index')
    end

    it 'returns HTTP success' do
      get('index')
      response.should be_success
    end

    it 'assigns all opened userstories as @current' do
      get('index')
      assigns(:current).should eq Userstory.where(status: 'opened')
    end

    it 'assigns all recent userstories as @recent' do
      create :userstory, status: 'recent'
      get :index
      expect(assigns(:recent)).not_to be_empty
    end

  end
end
