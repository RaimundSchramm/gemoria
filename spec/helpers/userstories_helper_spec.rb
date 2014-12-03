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
             " data-method=\"put\""+
             " data-remote=\"true\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}?userstory%5Bstatus%5D=started\""+
             " rel=\"nofollow\">Start</a>"
  end

  it 'returns a complete link' do
    expect(helper.complete_link(userstory))
      .to eq "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-method=\"put\""+
             " data-remote=\"true\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=completed\""+
             " rel=\"nofollow\">Complete</a>"
  end

  it 'returns an accept link' do
    expect(helper.accept_link(userstory))
    .to eq "<a"+
             " class=\"btn btn-default btn-xs\""+
           " data-method=\"put\""+
           " data-remote=\"true\""+
           " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=accepted\""+
           " rel=\"nofollow\">Accept</a>"
  end

  it 'returns a reject link' do
    expect(helper.reject_link(userstory))
      .to eq "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-method=\"put\""+
             " data-remote=\"true\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=rejected\""+
             " rel=\"nofollow\">Reject</a>"
  end

  it 'returns a couple of accept and reject links' do
    expect(helper.accept_and_reject_links(userstory))
      .to eq "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-method=\"put\""+
             " data-remote=\"true\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=accepted\""+
             " rel=\"nofollow\">Accept</a>"+
             "|"+
             "<a"+
             " class=\"btn btn-default btn-xs\""+
             " data-method=\"put\""+
             " data-remote=\"true\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=rejected\""+
             " rel=\"nofollow\">Reject</a>"
  end

  describe 'complete and incomplete links for acceptance tests' do
    it 'returns a complete link' do
      acceptance_test = create :acceptance_test, userstory: userstory, complete: false
      expect(helper.complete_acceptance_test_link(acceptance_test))
        .to eq "<a class=\"btn btn-default btn-xs\""+
               " data-method=\"put\""+
               " data-remote=\"true\""+
               " href=\"/userstories/#{userstory.id}\/acceptance_tests\/#{acceptance_test.id}?acceptance_test%5Bcomplete%5D=true\""+
               " id=\"complete_acceptance_test_#{acceptance_test.id}\" rel=\"nofollow\" title=\"complete\">"+
               "<span class=\"glyphicon glyphicon-ok\"></span></a>"
    end

    it 'returns an incomplete link' do
      acceptance_test = create :acceptance_test, userstory: userstory, complete: true
      expect(helper.complete_acceptance_test_link(acceptance_test))
        .to eq "<a class=\"btn btn-default btn-xs\""+
               " data-method=\"put\""+
               " data-remote=\"true\""+
               " href=\"/userstories/#{userstory.id}\/acceptance_tests\/#{acceptance_test.id}?acceptance_test%5Bcomplete%5D=false\""+
               " id=\"incomplete_acceptance_test_#{acceptance_test.id}\" rel=\"nofollow\" title=\"incomplete\">"+
               "<span class=\"glyphicon glyphicon-remove\"></span></a>"
    end
  end

  describe 'complete and incomplete links for tasks' do
    it 'returns a complete link' do
      task = create :task, userstory: userstory, complete: false
      expect(helper.complete_task_link(task))
        .to eq "<a class=\"btn btn-default btn-xs\""+
               " data-method=\"put\""+
               " data-remote=\"true\""+
               " href=\"/userstories/#{userstory.id}\/tasks\/#{task.id}?task%5Bcomplete%5D=true\""+
               " id=\"complete_task_#{task.id}\" rel=\"nofollow\" title=\"complete\">"+
               "<span class=\"glyphicon glyphicon-ok\"></span></a>"
    end

    it 'returns an incomplete link' do
      task = create :task, userstory: userstory, complete: true
      expect(helper.complete_task_link(task))
        .to eq "<a class=\"btn btn-default btn-xs\""+
               " data-method=\"put\""+
               " data-remote=\"true\""+
               " href=\"/userstories/#{userstory.id}\/tasks\/#{task.id}?task%5Bcomplete%5D=false\""+
               " id=\"incomplete_task_#{task.id}\" rel=\"nofollow\" title=\"incomplete\">"+
               "<span class=\"glyphicon glyphicon-remove\"></span></a>"
    end
  end

  describe 'edit links for items' do
    it 'returns an edit link' do
      task = create :task, userstory: userstory, complete: false
      expect(helper.edit_link(task))
        .to eq "<a class=\"btn btn-default btn-xs\""+
               " data-remote=\"true\""+
               " href=\"/userstories/#{task.userstory.id}/tasks/#{task.id}/edit\""+
               " id=\"edit_task_#{task.id}\""+
               " title=\"edit\">"+
               "<span class=\"glyphicon glyphicon-pencil\"></span></a>"
    end
  end

  describe 'destroy links for items' do
    it 'returns a destroy link' do
      task = create :task, userstory: userstory, complete: false
      expect(helper.destroy_link(task))
        .to eq "<a class=\"btn btn-default btn-xs\""+
               " data-confirm=\"Are you sure?\""+
               " data-method=\"delete\""+
               " data-remote=\"true\""+
               " href=\"/userstories/#{userstory.id}\/tasks/#{task.id}\""+
               " id=\"destroy_task_#{task.id}\""+
               " rel=\"nofollow\""+
               " title=\"destroy\">"+
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
             " data-method=\"put\""+
             " data-remote=\"true\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bposition%5D=sprint&amp;userstory%5Bsprint_id%5D=#{sprint.id}\""+
             " rel=\"nofollow\"><</a>"
    end

    it 'returns a move to backlog' do
      expect(helper.backlog_link(userstory))
      .to eq "<a class=\"btn btn-default btn-xs\""+
             " data-method=\"put\""+
             " data-remote=\"true\""+
             " href=\"/projects/#{userstory.project.id}/userstories/#{userstory.id}\?userstory%5Bposition%5D=backlog&amp;userstory%5Bsprint_id%5D=\""+
             " rel=\"nofollow\">></a>"
    end
  end
end
