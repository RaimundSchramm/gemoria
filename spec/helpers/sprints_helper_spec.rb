require 'spec_helper'

describe SprintsHelper, :type => :helper do
  let(:project) { create :project }
  let(:sprint)  { create :sprint, project: project }

  before do
    allow(project).to receive(:current_sprint_complete?).and_return true
    allow(project).to receive(:sprint).and_return [1]
  end

  describe 'change position links' do
    it 'returns a move to sprint link' do
      expect(helper.complete_sprint_link(sprint))
      .to eq "<a class=\"btn\""+
             " rel=\"nofollow\""+
             " data-method=\"patch\""+
             " href=\"/projects/#{sprint.project.id}/sprints/#{sprint.id}/complete\""+
             ">Complete sprint</a>"
    end

    xit 'returns a move to backlog' do
      expect(helper.complete_sprint_link(sprint))
      .to eq ""
    end
  end
end
