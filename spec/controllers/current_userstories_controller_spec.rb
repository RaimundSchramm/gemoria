require 'spec_helper'

describe CurrentUserstoriesController do
  describe 'GET #index' do
    it 'renders index template' do
      get('index')
      response.should render_template('index')
    end

    it 'returns HTTP success' do
      get('index')
      response.should be_success
    end

    it 'assigns all opened userstories' do
      get('index')
      assigns(:current_userstories).should eq Userstory.where(status: 'opened')
    end

  end
end
