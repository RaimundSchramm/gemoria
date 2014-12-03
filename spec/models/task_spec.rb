require 'spec_helper'

describe Task, :type => :model do
  context 'associations' do
    it { is_expected.to belong_to :userstory }
  end

  context 'scopes' do
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
