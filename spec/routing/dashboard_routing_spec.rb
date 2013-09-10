require 'spec_helper'

describe DashboardsController do
  describe 'RESTful routes' do
    it 'GET /show routes to dashboards#show' do
      expect(get '/dashboard').to route_to 'dashboards#show'
    end
  end
end
