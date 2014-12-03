require 'spec_helper'

describe User, :type => :model do

  let(:user)    { create :user }
  let(:project) { create :project }

  it { is_expected.to have_secure_password }

  context 'associations' do
    it { is_expected.to have_many :ownerships }
    it { is_expected.to have_many(:projects).through(:ownerships) }
  end

  describe 'attributes and constants' do
    it 'its name is present' do
      user = build :user, name: ''
      expect(user.save).to be_falsey
    end

    it 'its name is unique' do
      user2 = build :user, name: user.name
      expect(user2.save).to be_falsey
    end
  end

  describe '#has_ownership?(project)' do
    it 'returns false if there is no ownership for this project' do
      expect(user.has_ownership?(project)).to be_falsey
    end

    it 'returns true if there is an ownership for this project' do
      user.projects = [project]
      expect(user.has_ownership?(project)).to be_truthy
    end
  end
end
