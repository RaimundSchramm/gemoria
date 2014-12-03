require 'spec_helper'

describe CurrentUserstoriesController, :type => :controller do
  render_views

  let(:user) { create :user }
  def valid_session
    { user_id: user.id }
  end

  describe 'GET #index' do
    it 'renders index template' do
      get :index, {}, valid_session
      expect(response).to render_template('index')
    end

    it 'returns HTTP success' do
      get :index, {}, valid_session
      expect(response).to be_success
    end

    it 'assigns all opened userstories as @current' do
      get :index, {}, valid_session
      expect(assigns(:current)).to eq Userstory.where(status: 'opened')
    end

    xit 'assigns all recent userstories as @recent' do
      create :userstory, status: 'recent'
      get :index, {}, valid_session
      expect(assigns(:recent)).not_to be_empty
    end

  end
end
