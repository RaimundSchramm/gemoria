require 'spec_helper'

describe Project do
  context 'attributes and constants' do
    context 'derived attributes and counters' do
      let(:project) { FactoryGirl.create(:project) }
      describe '.size_of_all_userstories' do
        context 'WHEN it has no userstories' do
          it 'THEN it returns 0' do
            project.size_of_all_userstories.should eq 0
          end
        end

        context 'WHEN it has 1 or more userstories' do
          it 'THEN it returns their size' do
            FactoryGirl.create(:userstory, project: project)
            project.size_of_all_userstories.should eq 1
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
        let(:userstory) { FactoryGirl.create(:userstory, project: project) }
        context 'WHEN it has no tasks' do
          it 'THEN it returns 0' do
            project.size_of_all_tasks.should eq 0
          end
        end

        context 'WHEN it has 1 or more tasks' do
          it 'THEN it returns their size' do
            FactoryGirl.create(:task, userstory: userstory)
            project.size_of_all_tasks.should eq 1
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
            userstory = FactoryGirl.create(:userstory, project: project, status: Userstory::STATUS[:accepted])
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
            userstory = FactoryGirl.create(:userstory, project: project, status: Userstory::STATUS[:opened])
            expect(project.unaccepted_userstories).to eq [userstory]
          end
        end
      end
    end
  end
end
