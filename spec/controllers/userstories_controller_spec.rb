require 'spec_helper'

describe UserstoriesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "assigns all userstories" do
      get 'index'
      assigns(:userstories).should eq Userstory.all
    end

    it "renders index template" do
      get 'index'
      response.should render_template 'index'
    end
  end

  describe "GET 'new'" do
    it 'returns http success' do
      get 'new'
      response.should be_success
    end

    it 'assigns new userstory' do
      get 'new'
      assigns(:userstory).should be_a_new Userstory
    end

    it 'renders new template' do
      get 'new'
      response.should render_template 'new'
    end
  end
end
