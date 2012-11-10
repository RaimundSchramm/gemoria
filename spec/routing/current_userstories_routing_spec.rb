require 'spec_helper'

describe CurrentUserstoriesController do
  context 'routable RESTful actions' do
    it 'routes to #index' do
      get('/current_userstories').should route_to('current_userstories#index')
    end
  end
end