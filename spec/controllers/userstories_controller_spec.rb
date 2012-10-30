require 'spec_helper'

describe UserstoriesController do
  let(:project)   { create(:project) }
  let(:userstory) { create(:userstory, project: project) }

  def valid_attributes
    attributes_for(:userstory, project_id: project.id)
  end

  def valid_session
    {}
  end

  context 'before_filters' do
    xit 'responds to #parent' do
      controller.should respond_to :parent
    end

    describe '#parent' do
      context 'valid route' do
        it 'assigns the parent project for every REST action' do
          [:index, :new].each do |action|
            get action, valid_attributes, valid_session
            assigns(:project).should eq project
          end
        end
      end
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', valid_attributes, valid_session
      response.should be_success
    end

    it "assigns all completed userstories of the project" do
      create(:userstory, complete: true)
      get 'index', valid_attributes, valid_session
      assigns(:complete_userstories).should eq assigns(:project).complete_userstories
    end

    it "assigns all incompleted userstories of the project" do
      create(:userstory, complete: false)
      get 'index', valid_attributes, valid_session
      assigns(:incomplete_userstories).should eq assigns(:project).incomplete_userstories
    end

    it "renders index template" do
      get 'index', valid_attributes, valid_session
      response.should render_template 'index'
    end
  end

  describe "GET 'new'" do
    it 'returns http success' do
      get 'new', valid_attributes, valid_session
      response.should be_success
    end

    it 'assigns new userstory to parent project' do
      get 'new', valid_attributes, valid_session
      assigns(:userstory).should be_a_new Userstory
      assigns(:userstory).project_id.should eq project.id
    end

    it 'renders new template' do
      get 'new', valid_attributes, valid_session
      response.should render_template 'new'
    end
  end

  describe "POST 'create'" do
    context 'with valid params' do
      xit 'creates a new userstory' do
        expect {
          post 'create', { userstory: valid_attributes }, valid_session
        }.to change(Userstory, :count).by 1
      end

      xit 'assigns a newly created userstory as @userstory' do
        post 'create', { userstory: valid_attributes }, valid_session
        assigns(:userstory).should be_a Userstory
        assigns(:userstory).should be_persisted
      end

      xit 'redirects to index' do
        post 'create', { userstory: valid_attributes }, valid_session
        response.should redirect_to assigns(:userstory).project
      end
    end

    context 'with invalid params' do
      before do
        Userstory.any_instance.stub(:save).and_return false
      end

      xit 'assigns a new invalid userstory as @userstory' do
        post 'create', { userstory: {} }, valid_session
        assigns(:userstory).should be_a_new Userstory
      end

      xit 'rerenders new template' do
        post 'create', { userstory: {} }, valid_session
        response.should render_template 'new'
      end
    end
  end

  describe "GET 'show'" do
    xit 'assigns the userstory' do
      get 'show', { id: userstory.to_param }, valid_session
      assigns(:userstory).should eq userstory
    end

    xit 'renders show template' do
      get 'show', { id: userstory.to_param }, valid_session
      response.should render_template 'show'
    end
  end

  describe "PUT 'update'" do
    xit 'assigns the userstory' do
      put 'update', { id: userstory.to_param, userstory: valid_attributes }, valid_session
      assigns(:userstory).should eq userstory
    end

    xit 'redirects to index' do
      put 'update', { id: userstory.to_param, userstory: valid_attributes }, valid_session
      response.should redirect_to userstories_path
    end

    xit 'updates the userstory' do
      put 'update', { id: userstory.to_param, userstory: { name: 'US2' } }, valid_session
      userstory.reload
      assigns(:userstory).name.should eq 'US2'
    end
  end

  describe "DELETE 'destroy'" do
    xit 'assigns the userstory' do
      delete 'destroy', { id: userstory.to_param }, valid_session
      assigns(:userstory).should eq userstory
    end

    xit 'redirects to index' do
      delete 'destroy', { id: userstory.to_param }, valid_session
      response.should redirect_to userstories_path
    end

    xit 'deletes this userstory' do
      userstory = FactoryGirl.create(:userstory)
      expect {
        delete 'destroy', { id: userstory.to_param }, valid_session
      }.to change(Userstory, :count).from(1).to(0)
    end
  end
end
