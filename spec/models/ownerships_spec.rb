require 'spec_helper'

describe Ownership do
  context 'associations' do
    it { should belong_to :project }
    it { should belong_to :user }
  end
end
