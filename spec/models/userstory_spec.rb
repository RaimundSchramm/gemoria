require 'spec_helper'

describe Userstory do
  context 'scopes' do
    describe '.complete' do
      it 'returns all completed userstories' do
        Userstory.complete.should eq Userstory.where(complete: true)
      end
    end

    describe '.incomplete' do
      it 'returns all incompleted userstories' do
        Userstory.incomplete.should eq Userstory.where(complete: false)
      end
    end
  end
end
