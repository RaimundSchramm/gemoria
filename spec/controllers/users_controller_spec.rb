require 'spec_helper'

describe UsersController do

  render_views

  describe 'GET #new' do
    it 'assigns a new user' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it 'is successfull' do
      get :new
      expect(response).to be_success
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template 'new'
    end
  end

  describe 'POST #create' do
    let(:user_attr) { attributes_for :user }
    it 'assigns a new user' do
      post :create, user: user_attr
      expect(assigns(:user).name).to eq user_attr[:name]
    end

    it 'creates a new user' do
      expect { post :create, user: user_attr }.to change(User, :count).from(0).to(1)
      expect(assigns(:user)).to be_persisted
    end

    it 'redirects to root' do
      post :create, user: user_attr
      expect(response).to redirect_to root_path
    end
  end
end
