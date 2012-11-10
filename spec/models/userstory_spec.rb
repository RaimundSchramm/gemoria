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

    describe '.opened' do
      it 'returns all open userstories' do
        Userstory.opened.should eq Userstory.where(status: 'opened')
      end
    end
  end

  context 'derived attributes' do
    describe '#full_name' do
      it 'returns the name and the description as one string' do
        userstory = FactoryGirl.create(:userstory, name: 'US1', description: 'First Userstory')
        userstory.full_name.should eq 'US1: First Userstory'
      end
    end
  end
end
