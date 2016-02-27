require 'spec_helper'

describe ReleasesController, :type => :routing do

  it 'GET /releases routes to releases#index' do
    expect(get '/releases').to route_to 'releases#index'
  end
end
