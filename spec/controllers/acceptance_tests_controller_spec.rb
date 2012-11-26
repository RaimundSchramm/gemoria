require 'spec_helper'

describe AcceptanceTestsController do

  render_views

  let(:userstory)       { create(:userstory) }
  let!(:acceptance_test) { create(:acceptance_test, userstory: userstory, complete: false) }

  context 'before_filters' do
    describe 'find_userstory' do
      it 'assigns the parent userstory to @userstory' do
        get :index, { userstory_id: userstory.to_param }, {}
        assigns(:userstory).should eq userstory
      end
    end
  end

  describe 'GET index' do
    it 'returns http success' do
      get :index, { userstory_id: userstory.to_param }, {}
      response.should be_success
    end

    it 'renders index template' do
      get :index, { userstory_id: userstory.to_param }, {}
      response.should render_template 'index'
    end

    it 'assigns all incomplete acceptance tests as instance variable' do
      get :index, { userstory_id: userstory.to_param }, {}
      assigns(:incomplete_acceptance_tests).should eq [acceptance_test]
    end

    it 'assigns all complete acceptance tests as instance variable' do
      complete_acceptance_test = create(:acceptance_test, userstory: userstory, complete: true)
      get :index, { userstory_id: userstory.to_param }, {}
      assigns(:complete_acceptance_tests).should eq [complete_acceptance_test]
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new, { userstory_id: userstory.to_param }, {}
      response.should be_success
    end

    it 'renders index template' do
      get :new, { userstory_id: userstory.to_param }, {}
      response.should render_template 'new'
    end

    it 'assigns a new acceptance test as instance variable' do
      get :new, { userstory_id: userstory.to_param }, {}
      assigns(:acceptance_test).should be_a_new AcceptanceTest
      assigns(:acceptance_test).userstory_id.should eq userstory.id
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      let(:acceptance_test_attributes) { attributes_for(:acceptance_test) }

      it 'assigns a new acceptance test as instance variable' do
        post :create, { userstory_id: userstory.to_param, acceptance_test: acceptance_test_attributes }, {}
        assigns(:acceptance_test).should be_a AcceptanceTest
        assigns(:acceptance_test).userstory_id.should eq userstory.id
      end

      it 'saves the new acceptance test to the database' do
        expect {
          post :create, { userstory_id: userstory.to_param, acceptance_test: acceptance_test_attributes }, {}
        }.to change(AcceptanceTest, :count).by(1)
      end

      it 'redirects to index' do
        post :create, { userstory_id: userstory.to_param, acceptance_test: acceptance_test_attributes }, {}
        response.should redirect_to userstory_acceptance_tests_path(assigns(:userstory))
      end
    end

    context 'with invalid params' do
      before do
        AcceptanceTest.any_instance.stub(:save).and_return(false)
      end

      it 'assigns a new acceptance test as instance variable' do
        post :create, { userstory_id: userstory.to_param, acceptance_test: {} }, {}
        assigns(:acceptance_test).should be_a AcceptanceTest
        assigns(:acceptance_test).userstory_id.should eq userstory.id
      end

      it 'does not save the new acceptance test to the database' do
        expect {
          post :create, { userstory_id: userstory.to_param, acceptance_test: {} }, {}
        }.not_to change(AcceptanceTest, :count)
      end

      it 're-renders new' do
        post :create, { userstory_id: userstory.to_param, acceptance_test: {} }, {}
        response.should render_template 'new'
      end
    end
  end

  describe 'GET edit' do
    it 'returns http success' do
      get :edit, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, {}
      response.should be_success
    end

    it 'renders edit template' do
      get :edit, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, {}
      response.should render_template 'edit'
    end

    it 'assigns a new acceptance test as instance variable' do
      get :edit, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, {}
      assigns(:acceptance_test).should eq acceptance_test
      assigns(:acceptance_test).userstory_id.should eq userstory.id
    end
  end

  describe 'POST update' do
    let(:acceptance_test_attributes) { attributes_for(:acceptance_test, description: 'changed') }

    it 'assigns the acceptance test as instance variable' do
      put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: acceptance_test_attributes }, {}
      assigns(:acceptance_test).should eq acceptance_test
    end

    context 'with valid params' do
      it 'updates the acceptance test' do
        put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: acceptance_test_attributes }, {}
        assigns(:acceptance_test).reload
        assigns(:acceptance_test).description.should eq 'changed'
      end

      it 'redirects to index' do
        put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: acceptance_test_attributes }, {}
        response.should redirect_to userstory_acceptance_tests_path(assigns(:userstory))
      end
    end

    context 'with invalid params' do
      before { AcceptanceTest.any_instance.stub(:save).and_return(false) }

      it 'does not update the acceptance test' do
        put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: {} }, {}
        assigns(:acceptance_test).reload
        assigns(:acceptance_test).description.should eq 'MyText'
      end

      it 're-renders edit' do
        put :update, { userstory_id: userstory.to_param, id: acceptance_test.to_param, acceptance_test: {} }, {}
        response.should render_template 'edit'
      end
    end
  end

  describe 'DELETE destroy' do
    it 'assigns a new acceptance test as instance variable' do
      delete :destroy, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, {}
      assigns(:acceptance_test).should eq acceptance_test
      assigns(:acceptance_test).userstory_id.should eq userstory.id
    end

    it 'deletes the acceptance test from the database' do
      expect {
        delete :destroy, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, {}
      }.to change(AcceptanceTest, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, { userstory_id: userstory.to_param, id: acceptance_test.to_param }, {}
      response.should redirect_to userstory_acceptance_tests_path(assigns(:userstory))
    end
  end
end
