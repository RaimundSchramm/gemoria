require 'spec_helper'

describe Project, :type => :model do

  let(:project) { create :project }

  context 'associations' do
    it { is_expected.to have_many :sprints }
    it { is_expected.to have_many :userstories }
    it { is_expected.to have_many :ownerships }
    it { is_expected.to have_many(:users).through(:ownerships) }
  end

  context 'scopes' do
    describe 'default' do
      it 'orders by name' do
        names = ['0 first', 'a second', 'B third', 'c last']
        names.reverse.each { |name| create :project, name: name }
        expect(Project.pluck(:name)).to eq names
      end
    end
  end

  context 'attributes and constants' do
    context 'derived attributes and counters' do
      describe '.size_of_all_userstories' do
        context 'WHEN it has no userstories' do
          it 'THEN it returns 0' do
            expect(project.size_of_all_userstories).to eq 0
          end
        end

        context 'WHEN it has 1 or more userstories' do
          it 'THEN it returns their size' do
            create :userstory, project: project
            expect(project.size_of_all_userstories).to eq 1
          end
        end
      end

      describe '.size_of_accepted_userstories' do
        context 'WHEN it has no accepted userstories' do
          it 'THEN it returns 0' do
            create :userstory, project: project, status: Userstory::STATUS[:opened]
            expect(project.size_of_accepted_userstories).to eq 0
          end
        end

        context 'WHEN it has 1 or more accepted userstories' do
          xit 'THEN it returns their size' do
            create :userstory, project: project, status: Userstory::STATUS[:accepted]
            expect(project.size_of_accepted_userstories).to eq 1
          end
        end
      end

      describe '.size_of_all_tasks' do
        let(:userstory) { create :userstory, project: project }
        context 'WHEN it has no tasks' do
          it 'THEN it returns 0' do
            expect(project.size_of_all_tasks).to eq 0
          end
        end

        context 'WHEN it has 1 or more tasks' do
          it 'THEN it returns their size' do
            create :task, userstory: userstory
            expect(project.size_of_all_tasks).to eq 1
          end
        end
      end

      describe ' .size_of_completed_tasks' do
        let(:userstory) { create :userstory, project: project, status: Userstory::STATUS[:accepted] }
        context 'WHEN it has no completed tasks' do
          it 'THEN it returns 0' do
            create :task, userstory: userstory, complete: false
            expect(project.size_of_completed_tasks).to eq 0
          end
        end

        context 'WHEN it has 1 or more completed tasks' do
          xit 'THEN it returns their size' do
            create :task, userstory: userstory, complete: true
            expect(project.size_of_completed_tasks).to eq 1
          end
        end
      end

      describe '.accepted_userstories' do
        context 'WHEN it has no userstories' do
          it 'THEN it returns []' do
            expect(project.accepted_userstories).to eq []
          end
        end

        context 'WHEN it has 1 or more userstories that are accepted' do
          xit 'THEN it returns them' do
            userstory = create :userstory, project: project, status: Userstory::STATUS[:accepted]
            expect(project.accepted_userstories).to eq [userstory]
          end
        end
      end

      describe '.unaccepted_userstories' do
        context 'WHEN it has no userstories' do
          it 'THEN it returns []' do
            expect(project.unaccepted_userstories).to eq []
          end
        end

        context 'WHEN it has 1 or more userstories that are unaccepted' do
          it 'THEN it returns them' do
            userstory = create :userstory, project: project, status: Userstory::STATUS[:opened]
            expect(project.unaccepted_userstories).to eq [userstory]
          end
        end
      end

      describe '.backlog' do
        it 'returns all userstories in the backlog' do
          userstory = create :userstory, project: project
          expect(project.backlog).to eq [userstory]
        end
      end

      describe '.sprint' do
        it 'returns all userstories in the sprint' do
          userstory = create :userstory_sprint, project: project
          expect(project.sprint).to eq [userstory]
        end
      end
    end
  end

  describe '.current_sprint_complete?' do
    context 'WHEN at least one userstory of the current sprint are unaccepted' do
      it 'THEN it returns false' do
        userstory = create :userstory_sprint, project: project
        expect(project.current_sprint_complete?).to eq false
      end
    end

    context 'WHEN all userstories of the current sprint are accepted' do
      it 'THEN it returns true' do
        userstory = create :userstory_sprint_accepted, project: project
        expect(project.current_sprint_complete?).to eq true
      end
    end
  end

  context 'callbacks' do
    describe 'create_initial_sprint' do
      it 'creates a sprint after create' do
        project = build :project
        expect(project.sprints).to be_empty
        project.save
        expect(project.sprints.count).to eq 1
        expect(project.sprints).to eq [Sprint.last]
      end
    end
  end
end
