require 'spec_helper'

describe StaticPagesController, :type => :controller do

  render_views

  let(:user)    { create :admin }

  def valid_session
    { user_id: user.id }
  end

  describe 'GET style_guide' do
    it 'is successful' do
      get :style_guide, {}, valid_session
      expect(response).to be_success
    end

    it 'renders style_guide' do
      get :style_guide, {}, valid_session
      expect(response).to render_template 'style_guide'
    end
  end
end
