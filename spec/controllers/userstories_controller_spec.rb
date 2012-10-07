require 'spec_helper'

describe UserstoriesController do
  let(:userstory) { FactoryGirl.create(:userstory) }

  def valid_attributes
    FactoryGirl.attributes_for(:userstory)
  end

  def valid_session
    {}
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', {}, valid_session
      response.should be_success
    end

    it "assigns all completed userstories" do
      FactoryGirl.create(:userstory, complete: true)
      get 'index', {}, valid_session
      assigns(:complete_userstories).should eq Userstory.complete
    end

    it "assigns all incompleted userstories" do
      FactoryGirl.create(:userstory, complete: false)
      get 'index', {}, valid_session
      assigns(:incomplete_userstories).should eq Userstory.incomplete
    end

    it "renders index template" do
      get 'index', {}, valid_session
      response.should render_template 'index'
    end
  end

  describe "GET 'new'" do
    it 'returns http success' do
      get 'new', {}, valid_session
      response.should be_success
    end

    it 'assigns new userstory' do
      get 'new', {}, valid_session
      assigns(:userstory).should be_a_new Userstory
    end

    it 'renders new template' do
      get 'new', {}, valid_session
      response.should render_template 'new'
    end
  end

  describe "POST 'create'" do
    context 'with valid params' do
      it 'creates a new userstory' do
        expect {
          post 'create', { userstory: valid_attributes }, valid_session
        }.to change(Userstory, :count).by 1
      end

      it 'assigns a newly created userstory as @userstory' do
        post 'create', { userstory: valid_attributes }, valid_session
        assigns(:userstory).should be_a Userstory
        assigns(:userstory).should be_persisted
      end

      it 'redirects to index' do
        post 'create', { userstory: valid_attributes }, valid_session
        response.should redirect_to userstories_path
      end
    end

    context 'with invalid params' do
      before do
        Userstory.any_instance.stub(:save).and_return false
      end

      it 'assigns a new invalid userstory as @userstory' do
        post 'create', { userstory: {} }, valid_session
        assigns(:userstory).should be_a_new Userstory
      end

      it 'rerenders new template' do
        post 'create', { userstory: {} }, valid_session
        response.should render_template 'new'
      end
    end
  end

  describe "GET 'show'" do
    it 'assigns the userstory' do
      get 'show', { id: userstory.to_param }, valid_session
      assigns(:userstory).should eq userstory
    end

    it 'renders show template' do
      get 'show', { id: userstory.to_param }, valid_session
      response.should render_template 'show'
    end
  end

  describe "PUT 'update'" do
    it 'assigns the userstory' do
      put 'update', { id: userstory.to_param, userstory: valid_attributes }, valid_session
      assigns(:userstory).should eq userstory
    end

    it 'redirects to index' do
      put 'update', { id: userstory.to_param, userstory: valid_attributes }, valid_session
      response.should redirect_to userstories_path
    end

    it 'updates the userstory' do
      put 'update', { id: userstory.to_param, userstory: { name: 'US2' } }, valid_session
      userstory.reload
      assigns(:userstory).name.should eq 'US2'
    end
  end

  describe "DELETE 'destroy'" do
    it 'assigns the userstory' do
      delete 'destroy', { id: userstory.to_param }, valid_session
      assigns(:userstory).should eq userstory
    end

    it 'redirects to index' do
      delete 'destroy', { id: userstory.to_param }, valid_session
      response.should redirect_to userstories_path
    end

    it 'deletes this userstory' do
      userstory = FactoryGirl.create(:userstory)
      expect {
        delete 'destroy', { id: userstory.to_param }, valid_session
      }.to change(Userstory, :count).from(1).to(0)
    end
  end
end
