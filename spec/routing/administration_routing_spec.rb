require 'spec_helper'

describe AdministrationsController do
  describe 'routing' do
    it 'routes to #show' do
      get('/administration').should route_to('administrations#show')
    end
  end
end
