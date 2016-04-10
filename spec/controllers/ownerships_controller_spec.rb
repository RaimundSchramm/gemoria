require 'spec_helper'

describe OwnershipsController, :type => :controller do

  render_views

  let(:user)    { create :admin }
  let(:project) { create :project }

  def valid_session
    { user_id: user.id }
  end

  describe 'GET index' do
    it 'is successful' do
      get :index, {}, valid_session
      expect(response).to be_success
    end

    it 'assigns all ownerships of current user' do
      get :index, {}, valid_session
      expect(assigns(:ownerships)).not_to be_nil
    end

    it 'renders index' do
      get :index, {}, valid_session
      expect(response).to render_template 'index'
    end
  end

  describe 'GET edit_multiple' do
    it 'assigns all projects' do
      get :edit_multiple, {}, valid_session
      expect(assigns(:projects)).not_to be_nil
    end

    it 'renders edit_multiple' do
      get :edit_multiple, {}, valid_session
      expect(response).to render_template 'edit_multiple'
    end
  end

  describe 'POST create_or_delete_multiple' do
    it 'assigns all projects from params' do
      post :create_or_delete_multiple, { project_ids: [project.id] }, valid_session
      expect(assigns(:projects)).not_to be_nil
    end

    it 'creates or deletes the ownerships' do
      expect { post :create_or_delete_multiple, { project_ids: [project.id] }, valid_session }.to change(Ownership, :count).by 1
    end

    it 'redirects to index' do
      post :create_or_delete_multiple, {}, valid_session
      expect(response).to redirect_to ownerships_path
    end
  end

  describe 'GET edit' do
    let(:role) { Role.create name: 'Product Owner' }
    let(:ownership) { create :ownership, project: project }

    it 'assigns ownership' do
      get :edit, { id: ownership.to_param }, valid_session
      expect(assigns(:ownership)).not_to be_nil
    end

    it 'renders edit' do
      get :edit, { id: ownership.to_param }, valid_session
      expect(response).to render_template 'edit'
    end
  end

  describe 'PUT update' do
    let!(:role)      { Role.create name: 'Product Owner' }
    let!(:role2)     { Role.create name: 'Developer' }
    let!(:ownership) { create :ownership, project: project, role: role }

    it 'assigns ownership' do
      get :update, { id: ownership.to_param, ownership: { role_id: role2.id } }, valid_session
      expect(assigns(:ownership)).not_to be_nil
    end

    describe 'with valid params' do
      it 'updates ownership' do
        get :update, { id: ownership.to_param, ownership: { role_id: role2.id } }, valid_session
        expect(assigns(:ownership).role.name).to eq 'Developer'
      end

      it 'redirects to ownerships' do
        get :update, { id: ownership.to_param, ownership: { role_id: role2.id } }, valid_session
        expect(response).to redirect_to ownerships_path
      end
    end

    describe 'with invalid params' do
      before do
        allow_any_instance_of(Ownership).to receive(:update).and_return false
      end

      it 'must not update ownership' do
        get :update, { id: ownership.to_param, ownership: { role_id: role2.id } }, valid_session
        expect(assigns(:ownership).role.name).not_to eq 'Developer'
      end

      it 're-renders edit' do
        get :update, { id: ownership.to_param, ownership: { role_id: role2.id } }, valid_session
        expect(response).to render_template 'edit'
      end
    end
  end
end
