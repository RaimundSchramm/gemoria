require 'spec_helper'

describe SessionsController do

  render_views

  describe 'GET new' do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'is renders new' do
      get :new
      expect(response).to render_template 'new'
    end
  end


  describe 'POST create' do
    let(:user) { create :user }

    context 'valid' do

      let(:valid) { { name: user.name, password: user.password } }

      it 'assigns user if found by its name' do
        post :create, valid
        expect(assigns(:user)).to eq user
      end

      it 'welcomes the user as logged in' do
        post :create, valid
        expect(flash[:notice]).to eq 'Logged in.'
      end

      it 'redirects to home page' do
        post :create, valid
        expect(response).to redirect_to root_path
      end

      it 'sets the user id into the session' do
        post :create, valid
        expect(session[:user_id]).to eq user.id
      end
    end

    context 'invalid' do
      let(:invalid) { { name: 'wrong', password: 'login' } }

      it 'must not assign a user' do
        post :create, invalid
        expect(assigns(:user)).to be_nil
      end

      it 'says that login is wrong' do
        post :create, invalid
        expect(flash[:notice]).to eq 'Wrong login.'
      end

      it 'it rerenders new' do
        post :create, invalid
        expect(response).to render_template 'new'
      end

      it 'must not set a user id into the session' do
        post :create, invalid
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe 'DELETE destroy' do
    let(:user) { create :user }

    before do
      session[:user_id] = user.id
    end

    it 'it resets the session' do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to login' do
      delete :destroy
      expect(response).to redirect_to login_path
    end

    it 'shows a message' do
      delete :destroy
      expect(flash[:notice]).to eq 'Logged out.'
    end
  end
end
