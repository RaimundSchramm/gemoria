require 'spec_helper'

describe AcceptanceTestsController, :type => :controller do
  render_views

  let(:user)             { create :user }
  let(:userstory)        { create(:userstory) }
  let!(:acceptance_test) { create(:acceptance_test, userstory: userstory, complete: false) }

  def valid_session
    { user_id: user.id }
  end

  def valid_params
    { acceptance_test: { description: 'anything', complete: true } }
  end

  def invalid_params
    { description: 'anything', complete: false }
  end

  context 'before_filters' do
    describe 'find_userstory' do
      it 'assigns the parent userstory to @userstory' do
        get :index, { userstory_id: userstory.to_param }, valid_session
        expect(assigns(:userstory)).to eq userstory
      end
    end
  end

  describe 'GET index' do
    it 'returns http success' do
      get :index, { userstory_id: userstory.to_param }, valid_session
      expect(response).to be_success
    end

    it 'renders index template' do
      get :index, { userstory_id: userstory.to_param }, valid_session
      expect(response).to render_template 'index'
    end

    it 'assigns all incomplete acceptance tests as instance variable' do
      get :index, { userstory_id: userstory.to_param }, valid_session
      expect(assigns(:incomplete_acceptance_tests)).to eq [acceptance_test]
    end

    it 'assigns all complete acceptance tests as instance variable' do
      complete_acceptance_test = create(:acceptance_test, userstory: userstory, complete: true)
      get :index, { userstory_id: userstory.to_param }, valid_session
      expect(assigns(:complete_acceptance_tests)).to eq [complete_acceptance_test]
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new, { userstory_id: userstory.to_param }, valid_session
      expect(response).to be_success
    end

    it 'renders index template' do
      get :new, { userstory_id: userstory.to_param }, valid_session
      expect(response).to render_template 'new'
    end

    it 'assigns a new acceptance test as instance variable' do
      get :new, { userstory_id: userstory.to_param }, valid_session
      expect(assigns(:acceptance_test)).to be_a_new AcceptanceTest
      expect(assigns(:acceptance_test).userstory_id).to eq userstory.id
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      let(:acceptance_test_attributes) { attributes_for(:acceptance_test) }

      it 'assigns a new acceptance test as instance variable' do
        post :create, { userstory_id: userstory.to_param, acceptance_test: acceptance_test_attributes }, valid_session
        expect(assigns(:acceptance_test)).to be_a AcceptanceTest
        expect(assigns(:acceptance_test).userstory_id).to eq userstory.id
      end

      it 'saves the new acceptance test to the database' do
        expect {
          post :create, { userstory_id: userstory.to_param, acceptance_test: acceptance_test_attributes }, valid_session
        }.to change(AcceptanceTest, :count).by(1)
      end

      it 'redirects to index' do
        post :create, { userstory_id: userstory.to_param, acceptance_test: acceptance_test_attributes }, valid_session
        expect(response).to redirect_to userstory_acceptance_tests_path(assigns(:userstory))
      end
    end

    context 'with invalid params' do
      before do
        allow_any_instance_of(AcceptanceTest).to receive(:save).and_return(false)
      end

      it 'assigns a new acceptance test as instance variable' do
        post :create, { userstory_id: userstory.to_param, acceptance_test: { description: '', complete: '' } }, valid_session
        expect(assigns(:acceptance_test)).to be_a AcceptanceTest
        expect(assigns(:acceptance_test).userstory_id).to eq userstory.id
      end

      it 'does not save the new acceptance test to the database' do
        expect {
          post :create, { userstory_id: userstory.to_param, acceptance_test: { description: '', complete: '' } }, valid_session
        }.not_to change(AcceptanceTest, :count)
      end

      it 're-renders new' do
        post :create, { userstory_id: userstory.to_param, acceptance_test: { description: '', complete: '' } }, valid_session
        expect(response).to render_template 'new'
      end
    end
  end

  describe 'GET edit' do
    it 'returns http success' do
      get :edit, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, valid_session
      expect(response).to be_success
    end

    it 'renders edit template' do
      get :edit, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, valid_session
      expect(response).to render_template 'edit'
    end

    it 'assigns acceptance test as instance variable' do
      get :edit, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, valid_session
      expect(assigns(:acceptance_test)).to eq acceptance_test
      expect(assigns(:acceptance_test).userstory_id).to eq userstory.id
    end
  end

  describe 'POST update' do
    let(:acceptance_test_attributes) { attributes_for(:acceptance_test, description: 'changed') }

    it 'assigns the acceptance test as instance variable' do
      put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: acceptance_test_attributes }, valid_session
      expect(assigns(:acceptance_test)).to eq acceptance_test
    end

    context 'with valid params' do
      it 'updates the acceptance test' do
        put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: acceptance_test_attributes }, valid_session
        assigns(:acceptance_test).reload
        expect(assigns(:acceptance_test).description).to eq 'changed'
      end

      it 'redirects to index' do
        put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: acceptance_test_attributes }, valid_session
        expect(response).to redirect_to userstory_acceptance_tests_path(assigns(:userstory))
      end
    end

    context 'with invalid params' do
      before { allow_any_instance_of(AcceptanceTest).to receive(:save).and_return(false) }

      it 'does not update the acceptance test' do
        patch :update,
          { userstory_id:     userstory.to_param,
            id:               acceptance_test.to_param,
            acceptance_test:  { description: '', complete: '' } },
          valid_session

        assigns(:acceptance_test).reload
        expect(assigns(:acceptance_test).description).to eq 'MyText'
      end

      it 're-renders edit' do
        put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: invalid_params }, valid_session
        expect(response).to render_template 'edit'
      end
    end
  end

  describe 'DELETE destroy' do
    it 'assigns a new acceptance test as instance variable' do
      delete :destroy, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, valid_session
      expect(assigns(:acceptance_test)).to eq acceptance_test
      expect(assigns(:acceptance_test).userstory_id).to eq userstory.id
    end

    it 'deletes the acceptance test from the database' do
      expect {
        delete :destroy, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, valid_session
      }.to change(AcceptanceTest, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, valid_session
      expect(response).to redirect_to userstory_acceptance_tests_path(assigns(:userstory))
    end
  end
end
