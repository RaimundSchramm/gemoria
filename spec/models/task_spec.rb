require 'spec_helper'

describe Task, :type => :model do
  context 'associations' do
    it { is_expected.to belong_to :userstory }
  end

  context 'scopes' do
    describe 'default scope' do
      it 'orders tasks by their number' do
        task2 = Task.create(number: 2)
        task1 = Task.create(number: 1)
        expect(Task.all).to eq [task1, task2]
      end
    end

    describe '.complete' do
      it 'returns all completed tasks' do
        expect(Task.complete).to eq Task.where(complete: true)
      end
    end

    describe '.incomplete' do
      it 'returns all incompleted tasks' do
        expect(Task.incomplete).to eq Task.where(complete: false)
      end
    end
  end
end
