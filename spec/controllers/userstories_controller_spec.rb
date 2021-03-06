require 'spec_helper'

describe UserstoriesController, :type => :controller do
  render_views

  let(:user)       { create :user }
  let(:project)    { create :project }
  let!(:userstory) { create :userstory, project: project }
  let!(:sprint)    { create :sprint, project: project }
  let!(:role)      { create :role, name: 'Developer' }
  let!(:ownership) { create :ownership, project: project, user: user, role: role }

  def valid_attributes
    parent.merge(userstory: attributes_for(:userstory))
  end

  def parent
    { project_id: project.id }
  end

  def valid_session
    { user_id: user.id }
  end

  context 'before_filters' do
    xit 'responds to #parent' do
      expect(controller).to respond_to :parent
    end

    describe '#parent' do
      context 'valid route' do
        it 'assigns the parent project for every REST action' do
          [:index, :new].each do |action|
            get action, valid_attributes, valid_session
            expect(assigns(:project)).to eq project
          end
        end
      end
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', parent, valid_session
      expect(response).to be_success
    end

    it "assigns all accepted userstories of the project as @accepted" do
      userstory.update_attributes( { status: 'accepted', position: 'sprint' } )
      get 'index', parent, valid_session
      expect(assigns(:accepted_userstories)).not_to be_empty
      expect(assigns(:accepted_userstories)).to eq project.accepted_userstories
    end

    it "assigns all unaccepted userstories of the project" do
      userstory.update_attributes( { position: 'sprint' } )
      get 'index', parent, valid_session
      expect(assigns(:unaccepted_userstories)).not_to be_empty
      expect(assigns(:unaccepted_userstories).to_a).to eq project.unaccepted_userstories
    end

    it "renders index template" do
      get 'index', parent, valid_session
      expect(response).to render_template 'index'
    end

    it "assigns all backlog userstories of the project" do
      get 'index', parent, valid_session
      expect(assigns(:backlog)).to eq project.backlog
    end
  end

  describe "GET 'new'" do
    it 'returns http success' do
      get 'new', valid_attributes, valid_session
      expect(response).to be_success
    end

    it 'assigns new userstory to parent project' do
      get 'new', valid_attributes, valid_session
      expect(assigns(:userstory)).to be_a_new Userstory
      expect(assigns(:userstory).project_id).to eq project.id
    end

    it 'renders new template' do
      get 'new', valid_attributes, valid_session
      expect(response).to render_template 'new'
    end
  end

  describe "POST 'create'" do
    context 'with valid params' do
      it 'creates a new userstory' do
        expect {
          post 'create', valid_attributes, valid_session
        }.to change(Userstory, :count).by 1
      end

      it 'assigns a newly created userstory as @userstory' do
        post 'create', valid_attributes, valid_session
        expect(assigns(:userstory)).to be_a Userstory
        expect(assigns(:userstory)).to be_persisted
        expect(assigns(:userstory).project_id).to eq project.id
      end

      it 'redirects to index' do
        post 'create', valid_attributes, valid_session
        expect(response).to redirect_to assigns(:userstory).project
      end
    end

    context 'with invalid params' do
      before do
        allow_any_instance_of(Userstory).to receive(:save).and_return false
      end

      it 'assigns a new invalid userstory as @userstory' do
        post 'create', valid_attributes.merge(userstory: { description: '' }), valid_session
        expect(assigns(:userstory)).to be_a_new Userstory
      end

      it 'rerenders new template' do
        post 'create', valid_attributes.merge(userstory: { description: '' }), valid_session
        expect(response).to render_template 'new'
      end
    end
  end

  describe "GET 'show'" do
    it 'assigns the userstory' do
      get 'show', valid_attributes.merge(id: userstory.to_param), valid_session
      expect(assigns(:userstory)).to eq userstory
    end

    it 'renders show template' do
      get 'show', valid_attributes.merge(id: userstory.to_param), valid_session
      expect(response).to render_template 'show'
    end
  end

  describe "GET 'edit'" do
    it 'assigns the userstory' do
      get 'edit', valid_attributes.merge(id: userstory.to_param), valid_session
      expect(assigns(:userstory)).to eq userstory
    end

    it 'renders edit template' do
      get 'edit', valid_attributes.merge(id: userstory.to_param), valid_session
      expect(response).to render_template 'edit'
    end
  end

  describe "PUT 'update'" do
    it 'assigns the userstory' do
      put 'update', valid_attributes.merge(id: userstory.to_param, userstory: { name: 'US2' }), valid_session
      expect(assigns(:userstory)).to eq userstory
    end

    it 'redirects to index' do
      put 'update', valid_attributes.merge(id: userstory.to_param, userstory: { name: 'US2' }), valid_session
      expect(response).to redirect_to project_userstory_path(project, userstory)
    end

    it 'updates the userstory' do
      put 'update', valid_attributes.merge(id: userstory.to_param, userstory: { name: 'US2' }), valid_session
      userstory.reload
      expect(assigns(:userstory).name).to eq 'US2'
    end

    context 'with invalid params' do
      before do
        allow_any_instance_of(Userstory).to receive(:update_attributes).and_return false
      end

      it 'assigns a new invalid userstory as @userstory' do
        put 'update', valid_attributes.merge(id: userstory.to_param, userstory: { description: '' }), valid_session
        expect(assigns(:userstory)).to eq userstory
      end

      it 'rerenders edit template' do
        put 'update', valid_attributes.merge(id: userstory.to_param, userstory: { description: '' }), valid_session
        expect(response).to render_template 'edit'
      end
    end
  end

  describe "DELETE 'destroy'" do
    it 'assigns the userstory' do
      delete 'destroy', valid_attributes.merge({ id: userstory.to_param }), valid_session
      expect(assigns(:userstory)).to eq userstory
    end

    it 'redirects to index' do
      delete 'destroy', valid_attributes.merge({ id: userstory.to_param }), valid_session
      expect(response).to redirect_to project_userstories_path(project)
    end

    it 'deletes this userstory' do
      expect {
        delete 'destroy', valid_attributes.merge({ id: userstory.to_param }), valid_session
      }.to change(Userstory, :count).from(1).to(0)
      expect(assigns(:project).userstories.size).to eq 0
    end
  end
end
