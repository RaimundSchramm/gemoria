require 'spec_helper'

RSpec.describe ReleasesController, :type => :controller do

  describe 'GET #index' do
    it 'skips the authentication' do
      get :index
      expect(response).not_to be_redirect
      expect(response).not_to redirect_to(login_path)
    end

    it 'is authorized' do
      get :index
      expect(response).not_to be_redirect
      expect(response).not_to redirect_to(root_path)
    end

    it 'responds succcessfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end
end
