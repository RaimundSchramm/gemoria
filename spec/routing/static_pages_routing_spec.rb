require 'spec_helper'

describe StaticPagesController, :type => :routing do
  describe 'routing' do
    it 'routes to #style_guide' do
      expect(get('/static_pages/style_guide')).to route_to('static_pages#style_guide')
    end
  end
end
