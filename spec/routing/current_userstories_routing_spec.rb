require 'spec_helper'

describe CurrentUserstoriesController, :type => :routing do
  context 'routable RESTful actions' do
    it 'routes to #index' do
      expect(get('/current_userstories')).to route_to('current_userstories#index')
    end
  end
end