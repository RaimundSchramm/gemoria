require 'spec_helper'

describe Userstory do
  context 'scopes' do
    describe '.complete' do
      it 'returns all completed userstories' do
        create :userstory, complete: true
        Userstory.complete.should eq Userstory.where(complete: true)
      end
    end

    describe '.incomplete' do
      it 'returns all incompleted userstories' do
        create :userstory, complete: false
        Userstory.incomplete.should eq Userstory.where(complete: false)
      end
    end

    describe '.opened' do
      it 'returns all open userstories' do
        create :userstory, status: 'opened'
        Userstory.opened.should eq Userstory.where(status: 'opened')
      end
    end

    describe '.recent' do
      it 'returns all recently updated userstories' do
        create :userstory, status: 'recent'
        expect(Userstory.recent).to match_array Userstory.where(status: 'recent')
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

  context 'delegates' do
    describe '#incomplete_tasks' do
      it 'returns all incomplete tasks of userstory' do
        userstory = create(:userstory)
        task = create(:task, userstory: userstory, complete: false)
        userstory.incomplete_tasks.should eq [task]
      end
    end

    describe '#complete_tasks' do
      it 'returns all complete tasks of userstory' do
        userstory = create(:userstory)
        task = create(:task, userstory: userstory, complete: true)
        userstory.complete_tasks.should eq [task]
      end
    end
  end
end
