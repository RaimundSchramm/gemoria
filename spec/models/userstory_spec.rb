require 'spec_helper'

describe Userstory, :type => :model do

  let(:userstory) { create :userstory }

  context 'attributes and constants' do
  end

  context 'associations' do
    it { is_expected.to belong_to :project }
    it { is_expected.to belong_to :category }
    it { is_expected.to belong_to :sprint }
    it { is_expected.to have_many :acceptance_tests }
    it { is_expected.to have_many :tasks }
  end

  context 'scopes' do
    describe '.accepted' do
      it 'returns all accepted userstories' do
        create :userstory_sprint_accepted
        expect(Userstory.accepted).not_to be_empty
        expect(Userstory.accepted.to_a).to eq Userstory.where(status: Userstory::STATUS[:accepted])
      end
    end

    describe '.unaccepted' do
      it 'returns all unaccepted userstories' do
        create :userstory
        expect(Userstory.unaccepted).not_to be_empty
        expect(Userstory.unaccepted.to_a).to eq Userstory.where(status: Userstory::STATUS[:opened])
      end
    end

    describe '.opened' do
      it 'returns all open userstories' do
        create :userstory
        expect(Userstory.opened).not_to be_empty
        expect(Userstory.opened).to eq Userstory.where(status: 'opened')
      end
    end

    describe '.recent' do
      xit 'returns all recently updated userstories' do
        create :userstory, status: 'recent'
        expect(Userstory.recent).not_to be_empty
        expect(Userstory.recent).to match_array Userstory.where(status: 'recent')
      end
    end

    describe '.backlog' do
      it 'returns all backlog userstories' do
        create :userstory
        expect(Userstory.backlog).not_to be_empty
        expect(Userstory.backlog).to match_array Userstory.where(position: 'backlog')
      end
    end

    describe '.sprint' do
      it 'returns all sprint userstories' do
        create :userstory_sprint
        expect(Userstory.sprint).not_to be_empty
        expect(Userstory.sprint).to match_array Userstory.where(position: 'sprint')
      end
    end

    describe 'default scope' do
      it 'returns all userstories ordered by their last update latest to oldest' do
        create :userstory_sprint, name: 'first'
        create :userstory_sprint, name: 'last'
        Userstory.where(name: 'last').first.update(updated_at: DateTime.now.advance(seconds: 5))
        expect(Userstory.sprint.first.name).to eq 'first'
        expect(Userstory.sprint.last.name).to eq 'last'
      end
    end
  end

  context 'delegates' do
    let(:category)  { create(:category, name: 'Feature')}
    let(:userstory) { create(:userstory, category: category) }

    describe '#incomplete_tasks' do
      it 'returns all incomplete tasks of userstory' do
        task = create(:task, userstory: userstory, complete: false)
        expect(userstory.incomplete_tasks).to eq [task]
      end
    end

    describe '#complete_tasks' do
      it 'returns all complete tasks of userstory' do
        task = create(:task, userstory: userstory, complete: true)
        expect(userstory.complete_tasks).to eq [task]
      end
    end

    describe '#category_name' do
      it 'returns the name of the category' do
        expect(userstory.category_name).to eq 'Feature'
      end

      it 'returns an empty string if category is empty' do
        userstory.category = nil
        expect(userstory.category_name).to eq ''
      end
    end
  end

  context 'state changing methods' do
    describe '#done!' do
      it 'updates position to done' do
        userstory.done!
        expect(userstory.position).to eq Userstory::POSITION[:done]
      end
    end
  end

  context 'callbacks' do
    describe 'initialize_status_with_opened' do
      it 'initializes status with opened' do
        userstory = create :userstory, status: nil
        expect(userstory.status).to eq 'opened'
      end
    end

    describe 'initialize_position_with_backlog' do
      it 'initializes position with backlog' do
        userstory = create :userstory, position: nil
        expect(userstory.position).to eq 'backlog'
      end
    end
  end

  context 'derived attributes' do
    describe '#full_name' do
      it 'returns the name and the description as one string' do
        userstory = create(:userstory, name: 'US1', description: 'First Userstory')
        expect(userstory.full_name).to eq 'US1: First Userstory'
      end
    end
  end
end
