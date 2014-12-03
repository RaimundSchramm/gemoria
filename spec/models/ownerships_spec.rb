require 'spec_helper'

describe Ownership, :type => :model do
  context 'associations' do
    it { is_expected.to belong_to :project }
    it { is_expected.to belong_to :user }
  end
end
