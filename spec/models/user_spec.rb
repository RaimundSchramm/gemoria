require 'spec_helper'

describe User do

  let(:user) { build :user }

  describe 'attributes and constants' do
    it 'its name is present' do
      user = build :user, name: ''
      expect(user.save).to be_false
    end

    it 'its name is unique' do
      user = create :user
      user2 = build :user, name: user.name
      expect(user2.save).to be_false
    end
  end
end
