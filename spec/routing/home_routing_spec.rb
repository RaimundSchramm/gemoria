require 'spec_helper'

describe HomeController do

  it 'GET / routes to home#index' do
    expect(get '/').to route_to 'home#index'
  end
end
