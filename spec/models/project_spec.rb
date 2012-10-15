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

      describe '.size_of_completed_userstories' do
        context 'WHEN it has no completed userstories' do
          it 'THEN it returns 0' do
            FactoryGirl.create(:userstory, project: project, complete: false)
            project.size_of_completed_userstories.should eq 0
          end
        end

        context 'WHEN it has 1 or more complete userstories' do
          it 'THEN it returns their size' do
            FactoryGirl.create(:userstory, project: project, complete: true)
            project.size_of_completed_userstories.should eq 1
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

      describe '.size_of_completed_tasks' do
        context 'WHEN it has no completed tasks' do
          it 'THEN it returns 0' do
            userstory = FactoryGirl.create(:userstory, project: project, complete: false)
            FactoryGirl.create(:task, userstory: userstory, complete: false)
            project.size_of_completed_tasks.should eq 0
          end
        end

        context 'WHEN it has 1 or more completed tasks' do
          it 'THEN it returns their size' do
            userstory = FactoryGirl.create(:userstory, project: project, complete: true)
            FactoryGirl.create(:task, userstory: userstory, complete: true)
            project.size_of_completed_tasks.should eq 1
          end
        end
      end
    end
  end
end
