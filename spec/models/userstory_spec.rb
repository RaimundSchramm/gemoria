require 'spec_helper'

describe Userstory do

  context 'attributes and constants' do
  end

  context 'associations' do
  end

  context 'scopes' do
    describe '.accepted' do
      it 'returns all accepted userstories' do
        create :userstory, status: Userstory::STATUS[:accepted]
        expect(Userstory.accepted).to eq Userstory.where(status: Userstory::STATUS[:accepted])
      end
    end

    describe '.unaccepted' do
      it 'returns all unaccepted userstories' do
        create :userstory, status: Userstory::STATUS[:opened]
        expect(Userstory.unaccepted.all).to eq Userstory.where(status: Userstory::STATUS[:opened])
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

  context 'callbacks' do
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
    let(:category)  { create(:category, name: 'Feature')}
    let(:userstory) { create(:userstory, category: category) }

    describe '#incomplete_tasks' do
      it 'returns all incomplete tasks of userstory' do
        task = create(:task, userstory: userstory, complete: false)
        userstory.incomplete_tasks.should eq [task]
      end
    end

    describe '#complete_tasks' do
      it 'returns all complete tasks of userstory' do
        task = create(:task, userstory: userstory, complete: true)
        userstory.complete_tasks.should eq [task]
      end
    end

    describe '#category_name' do
      it 'returns the name of the category' do
        expect(userstory.category_name).to eq 'Feature'
      end
    end
  end
end
