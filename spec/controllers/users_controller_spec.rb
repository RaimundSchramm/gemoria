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
    context 'valid form input' do
      let(:valid) { attributes_for :user }

      it 'assigns a new user' do
        post :create, user: valid
        expect(assigns(:user).name).to eq valid[:name]
      end

      it 'creates a new user' do
        expect { post :create, user: valid }.to change(User, :count).from(0).to(1)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to root' do
        post :create, user: valid
        expect(response).to redirect_to root_path
      end

      it 'creates a session for the user' do
        post :create, user: valid
        expect(session[:user_id]).not_to be_nil
      end

      it 'shows a flash notice' do
        post :create, user: valid
        expect(flash[:notice]).to eq 'Thank you for signing up.'
      end
    end

    context 'invalid form input' do
      let(:invalid) { attributes_for :user, name: '' }

      it 'must not create a new user' do
        expect { post :create, user: invalid }.not_to change(User, :count)
      end

      it 'rerenders new' do
        post :create, user: invalid
        expect(response).to render_template 'new'
      end
    end
  end
end
