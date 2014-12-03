require 'spec_helper'

describe AdministrationsController, :type => :controller do

  let(:user) { create :admin }

  def valid_session
    { user_id: user.id }
  end

  describe 'GET #index' do
    it 'is succesfull' do
      get :show, {}, valid_session
      expect(response).to be_success
    end

    it 'renders index template' do
      get :show, {}, valid_session
      expect(response).to render_template 'show'
    end
  end
end
