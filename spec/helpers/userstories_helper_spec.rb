require 'spec_helper'

describe UserstoriesHelper do
  let(:project)   { create :project }
  let(:userstory) { create :userstory, project: project }

  it 'returns a link according to the next status update' do
    expect(helper.link_to_next_status(project, userstory)).to eq helper.start_link(project, userstory)
  end

  it 'returns a start link' do
    expect(helper.start_link(project, userstory))
      .to eq "<a href=\"/projects/#{project.id}/userstories/#{userstory.id}?userstory%5Bstatus%5D=started\" data-method=\"put\" data-remote=\"true\" rel=\"nofollow\">Start</a>"
  end

  it 'returns a complete link' do
    expect(helper.complete_link(project, userstory))
      .to eq "<a href=\"/projects/#{project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=completed\" data-method=\"put\" data-remote=\"true\" rel=\"nofollow\">Complete</a>"
  end

  it 'returns an accept link' do
    expect(helper.accept_link(project, userstory))
    .to eq "<a href=\"/projects/#{project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=accepted\" data-method=\"put\" data-remote=\"true\" rel=\"nofollow\">Accept</a>"
  end

  it 'returns a reject link' do
    expect(helper.reject_link(project, userstory))
      .to eq "<a href=\"/projects/#{project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=rejected\" data-method=\"put\" data-remote=\"true\" rel=\"nofollow\">Reject</a>"
  end

  it 'returns a couple of accept and reject links' do
    expect(helper.accept_and_reject_links(project, userstory))
      .to eq "<a href=\"/projects/#{project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=accepted\" data-method=\"put\" data-remote=\"true\" rel=\"nofollow\">Accept</a>|<a href=\"/projects/#{project.id}/userstories/#{userstory.id}\?userstory%5Bstatus%5D=rejected\" data-method=\"put\" data-remote=\"true\" rel=\"nofollow\">Reject</a>"
  end

end
