require 'spec_helper'

describe AdministrationsController, :type => :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get('/administration')).to route_to('administrations#show')
    end
  end
end
