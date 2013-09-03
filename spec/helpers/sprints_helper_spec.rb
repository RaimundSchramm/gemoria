require 'spec_helper'

describe SprintsHelper do
  let(:project) { create :project }
  let(:sprint)  { create :sprint, project: project }

  before do
    project.stub(:current_sprint_complete?).and_return true
    project.stub(:sprint).and_return [1]
  end

  describe 'change position links' do
    it 'returns a move to sprint link' do
      expect(helper.complete_sprint_link(sprint))
      .to eq "<a href=\"/projects/#{sprint.project.id}/sprints/#{sprint.id}/complete\""+
             " class=\"btn\""+
             " data-method=\"put\""+
             " rel=\"nofollow\">Complete sprint</a>"
    end

    xit 'returns a move to backlog' do
      expect(helper.complete_sprint_link(sprint))
      .to eq ""
    end
  end
end
