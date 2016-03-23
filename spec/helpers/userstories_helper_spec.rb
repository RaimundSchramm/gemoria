require 'spec_helper'

describe UserstoriesHelper, :type => :helper do
  let!(:userstory) { create :userstory }

  it 'returns a link according to the next status update' do
    expect(helper.link_to_next_status(userstory)).to eq helper.start_link(userstory)
  end

  it 'returns a start link' do
    expect(helper.start_link(userstory))
      .to eq "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-remote=\"true\""+
             " rel=\"nofollow\""+
             " data-method=\"put\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}?userstory%5Bstatus%5D=started\">"+
             "Start"+
             "</a>"
  end

  it 'returns a complete link' do
    expect(helper.complete_link(userstory))
      .to eq "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-remote=\"true\""+
             " rel=\"nofollow\""+
             " data-method=\"put\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=completed\">"+
             "Complete</a>"
  end

  it 'returns an accept link' do
    expect(helper.accept_link(userstory))
    .to eq "<a"+
           " class=\"btn btn-default btn-xs\""+
           " data-remote=\"true\""+
           " rel=\"nofollow\""+
           " data-method=\"put\""+
           " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=accepted\">"+
           "Accept"+
           "</a>"
  end

  it 'returns a reject link' do
    expect(helper.reject_link(userstory))
      .to eq "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-remote=\"true\""+
             " rel=\"nofollow\""+
             " data-method=\"put\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=rejected\">"+
             "Reject"+
             "</a>"
  end

  it 'returns a couple of accept and reject links' do
    expect(helper.accept_and_reject_links(userstory))
      .to eq "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-remote=\"true\""+
             " rel=\"nofollow\""+
             " data-method=\"put\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=accepted\">"+
             "Accept"+
             "</a>"+
             "|"+
             "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-remote=\"true\""+
             " rel=\"nofollow\""+
             " data-method=\"put\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=rejected\">"+
             "Reject"+
             "</a>"
  end

  describe 'complete and incomplete links for acceptance tests' do
    it 'returns a complete link' do
      acceptance_test = create :acceptance_test, userstory: userstory, complete: false
      expect(helper.complete_acceptance_test_link(acceptance_test))
        .to eq "<a"+
               " title=\"complete\""+
               " id=\"complete_acceptance_test_#{acceptance_test.id}\""+
               " class=\"btn btn-default btn-xs\""+
               " data-remote=\"true\""+
               " rel=\"nofollow\""+
               " data-method=\"put\""+
               " href=\"/userstories/#{userstory.id}\/acceptance_tests\/#{acceptance_test.id}?acceptance_test%5Bcomplete%5D=true\">"+
               "<span class=\"glyphicon glyphicon-ok\"></span></a>"
    end

    it 'returns an incomplete link' do
      acceptance_test = create :acceptance_test, userstory: userstory, complete: true
      expect(helper.complete_acceptance_test_link(acceptance_test))
        .to eq "<a"+
               " title=\"incomplete\""+
               " id=\"incomplete_acceptance_test_#{acceptance_test.id}\""+
               " class=\"btn btn-default btn-xs\""+
               " data-remote=\"true\""+
               " rel=\"nofollow\""+
               " data-method=\"put\""+
               " href=\"/userstories/#{userstory.id}\/acceptance_tests\/#{acceptance_test.id}?acceptance_test%5Bcomplete%5D=false\">"+
               "<span class=\"glyphicon glyphicon-remove\"></span></a>"
    end
  end

  describe 'complete and incomplete links for tasks' do
    it 'returns a complete link' do
      task = create :task, userstory: userstory, complete: false
      expect(helper.complete_task_link(task))
        .to eq "<a title=\"complete\""+
               " id=\"complete_task_#{task.id}\""+
               " class=\"btn btn-default btn-xs\""+
               " data-remote=\"true\""+
               " rel=\"nofollow\""+
               " data-method=\"put\""+
               " href=\"/userstories/#{userstory.id}\/tasks\/#{task.id}?task%5Bcomplete%5D=true\">"+
               "<span class=\"glyphicon glyphicon-ok\"></span></a>"
    end

    it 'returns an incomplete link' do
      task = create :task, userstory: userstory, complete: true
      expect(helper.complete_task_link(task))
        .to eq "<a title=\"incomplete\""+
               " id=\"incomplete_task_#{task.id}\""+
               " class=\"btn btn-default btn-xs\""+
               " data-remote=\"true\""+
               " rel=\"nofollow\""+
               " data-method=\"put\""+
               " href=\"/userstories/#{userstory.id}\/tasks\/#{task.id}?task%5Bcomplete%5D=false\">"+
               "<span class=\"glyphicon glyphicon-remove\"></span></a>"
    end
  end

  describe 'edit links for items' do
    it 'returns an edit link' do
      task = create :task, userstory: userstory, complete: false
      expect(helper.edit_link(task))
        .to eq "<a title=\"edit\""+
               " id=\"edit_task_#{task.id}\""+
               " class=\"btn btn-default btn-xs\""+
               " data-remote=\"true\""+
               " href=\"/userstories/#{task.userstory.id}/tasks/#{task.id}/edit\">"+
               "<span class=\"glyphicon glyphicon-pencil\"></span></a>"
    end
  end

  describe 'destroy links for items' do
    it 'returns a destroy link' do
      task = create :task, userstory: userstory, complete: false
      expect(helper.destroy_link(task))
        .to eq "<a data-confirm=\"Are you sure?\""+
               " title=\"destroy\""+
               " id=\"destroy_task_#{task.id}\""+
               " class=\"btn btn-default btn-xs\""+
               " data-remote=\"true\""+
               " rel=\"nofollow\""+
               " data-method=\"delete\""+
               " href=\"/userstories/#{userstory.id}\/tasks/#{task.id}\">"+
               "<span class=\"glyphicon glyphicon-trash\"></span></a>"
    end
  end

  describe 'completeness of items' do
    it 'returns complete class it item is complete' do
      [build(:userstory, status: Userstory::STATUS[:accepted]), build(:acceptance_test, complete: true), build(:task, complete: true)].each do |item|
        expect(helper.complete_class(item)).to eq 'complete'
      end
    end

    it 'returns incomplete class it item is incomplete' do
      [build(:userstory, status: Userstory::STATUS[:opened]), build(:acceptance_test, complete: false), build(:task, complete: false)].each do |item|
        expect(helper.complete_class(item)).to eq 'incomplete'
      end
    end
  end

  describe 'change position links' do
    let(:sprint) { userstory.project.sprints.first }
    it 'returns a move to sprint link' do
      expect(helper.sprint_link(userstory))
      .to eq "<a class=\"btn btn-default btn-xs\""+
             " data-remote=\"true\""+
             " rel=\"nofollow\""+
             " data-method=\"put\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bposition%5D=sprint&amp;userstory%5Bsprint_id%5D=#{sprint.id}\">"+
             "<"+
             "</a>"
    end

    it 'returns a move to backlog' do
      expect(helper.backlog_link(userstory))
      .to eq "<a class=\"btn btn-default btn-xs\""+
             " data-remote=\"true\""+
             " rel=\"nofollow\""+
             " data-method=\"put\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bposition%5D=backlog&amp;userstory%5Bsprint_id%5D=\">"+
             ">"+
             "</a>"
    end
  end
end
