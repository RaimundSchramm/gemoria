require 'spec_helper'

describe Task do
  context 'associations' do
    it { should belong_to :userstory }
  end

  context 'scopes' do
    describe '.complete' do
      it 'returns all completed tasks' do
        Task.complete.should eq Task.where(complete: true)
      end
    end

    describe '.incomplete' do
      it 'returns all incompleted tasks' do
        Task.incomplete.should eq Task.where(complete: false)
      end
    end
  end
end
