require 'spec_helper'

describe User do

  let(:user) { build :user }

  describe 'attributes and constants' do
    it 'its name is unique' do
      create :user, name: 'me'
      user.name = 'me'
      expect(user.save).to be_false
    end
  end
end
